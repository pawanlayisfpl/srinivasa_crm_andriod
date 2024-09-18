// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/database/punch_in_database.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/database/punch_out_database.dart';

import '../../../../../core/core.dart';
import '../../../../../core/model/model.dart';
import '../../../domain/domain.dart';

abstract class MarkAttendanceRemoteDataSource {
  Future<PunchInOutResponseModel> punchIn({required PunchInPostModel punchInPostModel});
  Future<PunchInOutResponseModel> punchOut({required PunchoutPostModel punchInPostModel});
  Future<LastPunchInResponseModel> getLastPunchInOutDetails();
}


@Injectable(as: MarkAttendanceRemoteDataSource)
class MarkAttendanceRemoteDatasourceImpl implements MarkAttendanceRemoteDataSource {
final DioClient dioClient;
final Logger logger;
final KeyValueStorage keyValueStorage;
final InternetChecker internetChecker;

  MarkAttendanceRemoteDatasourceImpl({
    required this.dioClient,
    required this.logger,
    required this.keyValueStorage,
    required this.internetChecker,
  });
  
  @override
  Future<LastPunchInResponseModel> getLastPunchInOutDetails() async {
    final results = await internetChecker.hasInternet();

    if(results) {
      try {
      logger.d('GET LAST PUNCH IN OUT DETAILS API STARTED');
      final response = await dioClient.post(Endpoints.lastPunchInDetails,headers: {});

      if(response.statusCode == 200){
        logger.d('GET LAST PUNCH IN OUT DETAILS API SUCCESS');
        return await Future.value(LastPunchInResponseModel.fromJson(response.data));
      }else{
        logger.e('GET LAST PUNCH IN OUT DETAILS API FAILED');
        throw NetworkExceptions.getDioException(response.data);
      }
      
    } on DioException  catch(e) {
         throw NetworkExceptions.getDioException(e);
      

    }

    }else {
        return LastPunchInResponseModel(
          message: 'No records found',
          status: true
        );


      // throw const NetworkExceptions.noInternetConnection();

    }


    
  }
  
  @override
  Future<PunchInOutResponseModel> punchIn({required PunchInPostModel punchInPostModel}) async {
    final results = await internetChecker.hasInternet();
    final database = PunchInPostDatabase();


    if(results) {
      try{
      final response = await dioClient.post(Endpoints.punchIn,data: punchInPostModel.toJson(),headers: {});
      if(response.statusCode == 200){
        return PunchInOutResponseModel.fromJson(response.data);
      }else{
        throw  NetworkExceptions.getDioException(response.data);
      }

    }on DioException catch(e) {
      throw NetworkExceptions.getDioException(e);
    }on SocketException catch(e) {
      throw const NetworkExceptions.noInternetConnection();
    }

    }else {
      final id = await database.insertPunchInPost(punchInPostModel);
      if(id != 0) {
        return PunchInOutResponseModel(
            message: 'Punch is successfull',
            status: true
        );
      }else {
        throw const NetworkExceptions.noInternetConnection();
      }

    }



    
  }
  
  @override
  Future<PunchInOutResponseModel> punchOut({required PunchoutPostModel punchInPostModel}) async {
    final results = await internetChecker.hasInternet();
    final database = PunchoutPostDatabase();
    if(results) {
      try {
      final response = await dioClient.post(Endpoints.punchOut,data: punchInPostModel.toJson(),headers: {});
      if(response.statusCode == 200){
        return PunchInOutResponseModel.fromJson(response.data);
      }else{
        throw  NetworkExceptions.getDioException(response.data);
      }
      
    }  on DioException catch(e)   {
      throw NetworkExceptions.getDioException(e);
      
    }

    }else {
      final id = await database.insertPunchoutPost(punchInPostModel);
      if(id != 0) {
        return PunchInOutResponseModel(
          message: 'Punch out is successfull',
          status: true
        );
      }else {
      throw const NetworkExceptions.noInternetConnection();


      }

    }
    
    
  }



}
