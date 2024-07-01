import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

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

  MarkAttendanceRemoteDatasourceImpl({required this.dioClient, required this.logger, required this.keyValueStorage});
  
  @override
  Future<LastPunchInResponseModel> getLastPunchInOutDetails() async {

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
      
    }  catch(e) {
      if(e is DioException) {
         if(e.response != null) {
         logger.e(e.response!.data['error'].toString()+" "+e.response!.data['status'].toString());
    throw NetworkExceptions.getException(e);

      }else {
        throw NetworkExceptions.getDioException(e);
      }
      }else {
        throw const NetworkExceptions.formatException();
      }

    }
  }
  
  @override
  Future<PunchInOutResponseModel> punchIn({required PunchInPostModel punchInPostModel}) async {
    try{
      final response = await dioClient.post(Endpoints.punchIn,data: punchInPostModel.toJson(),headers: {});
      if(response.statusCode == 200){
        return PunchInOutResponseModel.fromJson(response.data);
      }else{
        throw const NetworkExceptions.unexpectedError();
      }

    }on DioException catch(e) {
      throw NetworkExceptions.getException(e);
    }on SocketException catch(e) {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
  
  @override
  Future<PunchInOutResponseModel> punchOut({required PunchoutPostModel punchInPostModel}) async {
    
    try {
      final response = await dioClient.post(Endpoints.punchOut,data: punchInPostModel.toJson(),headers: {});
      if(response.statusCode == 200){
        return PunchInOutResponseModel.fromJson(response.data);
      }else{
        throw const NetworkExceptions.unexpectedError();
      }
      
    }  on DioException catch(e)   {
      throw NetworkExceptions.getDioException(e);
      
    }
  }



}