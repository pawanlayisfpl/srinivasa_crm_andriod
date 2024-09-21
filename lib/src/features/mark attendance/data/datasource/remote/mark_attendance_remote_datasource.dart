// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/src/config/constants/appconfig.dart';
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
  // TODO: REMOVE ! FROM IF CONDITION

    if(results) {
      try {
      debugPrint('GET LAST PUNCH IN OUT DETAILS API STARTED');
      final response = await dioClient.post(Endpoints.lastPunchInDetails,headers: {});

      if(response.statusCode == 200){
        debugPrint('GET LAST PUNCH IN OUT DETAILS API SUCCESS');
        return  LastPunchInResponseModel.fromJson(response.data);
      }else{
        debugPrint('GET LAST PUNCH IN OUT DETAILS API FAILED');
        throw NetworkExceptions.getDioException(response.data);
      }
      
    } on DioException  catch(e) {
         throw NetworkExceptions.getDioException(e);
      

    }

    }else {
      // HOW TO GET STATUS OF PUNCH IN OUT

//       PUNCHOUT DATA EXISTS
// LAST PUNCH IN DATA
// LAST PUNCH OUT DATA

  if(AppConfig.isOfflineEnabled) {

 final punchIndDtabase = PunchInPostDatabase();
final punchoutDatabase = PunchoutPostDatabase();

// await punchIndDtabase.deletePunchInPost();
// await punchoutDatabase.deleteAllPunchoutPosts();

List<PunchInPostModel?> punchLIsts = await punchIndDtabase.getAllPunchInPosts();
List<PunchoutPostModel?> punchOutLists = await punchoutDatabase.getAllPunchoutPosts();

if (punchLIsts.isNotEmpty && punchOutLists.isNotEmpty) {
  final lastPunchIn = punchLIsts.last;
  final lastPunchOut = punchOutLists.last;

  if (DateTime.parse(lastPunchIn!.createdAt.toString()).isAfter(DateTime.parse(lastPunchOut!.createdAt))) {
    return LastPunchInResponseModel(
      message: 'Punch in is after punch out',
      status: false,
    );
  } else {
    return LastPunchInResponseModel(
      message: 'Punch in is not after punch out',
      status: true,
    );
  }
} else {
  return LastPunchInResponseModel(
    message: 'Both lists should not be empty',
    status: true,
  );
}

  }else {
    throw const NetworkExceptions.noInternetConnection();
  }



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
    }on SocketException  {
      throw const NetworkExceptions.noInternetConnection();
    }

    }else {
     
      if(AppConfig.isOfflineEnabled) {
         // await database.deletePunchInPost();
      final id = await database.insertPunchInPost(punchInPostModel);
      if(id != 0) {
        return PunchInOutResponseModel(
            message: 'Punch is successfull',
            status: true
        );
      }else {
        throw const NetworkExceptions.noInternetConnection();
      }

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
     if(AppConfig.isOfflineEnabled) {
       // await database.deleteAllPunchoutPosts();
      final id = await database.insertPunchoutPost(punchInPostModel);
      if(id != 0) {
        return PunchInOutResponseModel(
          message: 'Punch out is successfull',
          status: true
        );
      }else {
      throw const NetworkExceptions.noInternetConnection();


      }

     }else{
        throw const NetworkExceptions.noInternetConnection();
     }

    }
    
    
  }



}
