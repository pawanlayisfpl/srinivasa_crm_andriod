// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/all_employe_model.dart';

import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_reporting_manager_model.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import '../../../../../src/core/model/model.dart';
import '../../../../domain/model/Employe/single_employe_model.dart';
import '../../../../domain/model/Employe/update_emloye_post_model.dart';
import '../../../../domain/repo/Employe/roles_model.dart';

abstract class EmployeDataSource{
  Future<List<EmployeeModel>> getEmployesList();
  Future<SingleEmployeModel?> getEmployeById({required String employeId});
  Future<List<RolesModel>> getAllRoles();
  Future<AllEmployesModel?> getAllGloablEmployesList();
  Future<EmployeReportingManagerModel?> getEmployeReportingMangers(String zoneId);
  Future<bool?> updateEmploye({required UpdateEmployeePostModel updateEmployePostModel});
}




@Injectable(as: EmployeDataSource)
class EmployeRemoteDatasourceImpl implements EmployeDataSource {

  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final InternetChecker internetChecker;
  final Logger logger;

  EmployeRemoteDatasourceImpl({
    required this.dioClient,
    required this.keyValueStorage,
    required this.internetChecker,
    required this.logger,
  });
  
  @override
  Future<List<EmployeeModel>> getEmployesList() async {
    debugPrint('EMPLOYE API STARTED');
    final results = await internetChecker.isConnected();

    if(results) {

debugPrint('EMPLOYE API CALL MADE THROUGH INTERNET');
      try {
        final response = await dioClient.get(Endpoints.allEmployess,headers: {},);

        if(response.statusCode == 200) {
          debugPrint('EMPLOYE API SUCCESS');
          final List data = response.data;
          


          return data.map((e) => EmployeeModel.fromJson(e)).toList();

        }else {
          debugPrint('EMPLYEE API FAILED');
          throw NetworkExceptions.getDioException(response.data);
        }
        
      } catch (e) {
        debugPrint('EMPLYEE API FAILED');
        if(e is DioException) {
        debugPrint(e.response != null ? e.response!.data : e.message);

          throw NetworkExceptions.getDioException(e);
        }else {
          throw const NetworkExceptions.badRequest();
        }
        
      }

    }else {

      throw const NetworkExceptions.noInternetConnection();
    }
  }
  
  @override
  Future<SingleEmployeModel?> getEmployeById({required String employeId}) async  {
    try {
      final response  = await dioClient.get(Endpoints.getEmployeById+employeId,headers: {});
      if(response.statusCode == 200) {
        SingleEmployeModel? employeModel = SingleEmployeModel.fromJson(response.data);
        return employeModel;

      }else {
        throw NetworkExceptions.getDioException(response.data);
      }
      
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
      
    }
  }
  
  @override
  Future<List<RolesModel>> getAllRoles()  async {
   try {
      final response  = await dioClient.get(Endpoints.getAllRoles,headers: {});
      if(response.statusCode == 200) {
        List data = response.data;

        return data.map((e) => RolesModel.fromJson(e)).toList();

      }else {
        throw NetworkExceptions.getDioException(response.data);
      }
      
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
      
    }
  }
  
  @override 
  Future<AllEmployesModel?> getAllGloablEmployesList()  async {
    try {
      final response = await dioClient.get(Endpoints.getAllGloablEmployes,headers: {});
    if(response.statusCode == 200) {
      return AllEmployesModel.fromJson(response.data);

      }else {
        throw NetworkExceptions.getDioException(response.data);
      }      
    } on DioException catch (e) {
              throw NetworkExceptions.getDioException(e);


      
    }
  }
  
  @override
  Future<EmployeReportingManagerModel?> getEmployeReportingMangers(String zoneId) async {
      try {
      final response = await dioClient.post(Endpoints.getReportingMangersUrl,headers: {},data: {
        "zoneId" : zoneId,
      });
    if(response.statusCode == 200) {
      return EmployeReportingManagerModel.fromJson(response.data);

      }else {
        throw NetworkExceptions.getDioException(response.data);
      }      
    } on DioException catch (e) {
              throw NetworkExceptions.getDioException(e);


      
    }
  
  }
  
  @override
  Future<bool?> updateEmploye({required UpdateEmployeePostModel updateEmployePostModel}) async  {
    try {
      final response = await dioClient.patch(Endpoints.updateEmployeApi+updateEmployePostModel.userId,data: updateEmployePostModel.toMap(),headers: {});
      if(response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }else {
              throw NetworkExceptions.getDioException(response.data);

        
      }
      
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
      
    }
  }

}
