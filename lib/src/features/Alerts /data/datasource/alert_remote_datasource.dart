
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/config/constants/appconfig.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/get/alert_count_resonse_model.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/get/alert_response_model.dart';

import '../../database/alert_database.dart';
import '../../domain/model/post/mark_alert_as_read_postmodel.dart';

abstract class AlertRemoteDataSource {
  Future<List<AlertModel>> getAlerts();
  Future<AlertCountModel> getAlertCounts();
  Future<bool> markAsRead(
      {required MarkAlertAsReadPostModel markAlertAsReadPostModel});
}

@Injectable(as: AlertRemoteDataSource)
class AlertRemoteDataSourceImpl implements AlertRemoteDataSource {
  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final InternetChecker internetChecker;

  AlertRemoteDataSourceImpl(
      {required this.dioClient,
      required this.keyValueStorage,
      required this.internetChecker});
  @override
  Future<AlertCountModel> getAlertCounts() async {
        final results = await internetChecker.isConnected();
        debugPrint("${results}printing bool vaue in alerts counts");

    try {
      final response = await dioClient.get(Endpoints.getAlertNotificationCount, headers: {});

      if (response.statusCode == 200) {
        return AlertCountModel.fromJson(response.data);
      } else {
        throw NetworkExceptions.getDioException(response.data);
      }
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  @override
  Future<List<AlertModel>> getAlerts() async {
    final results = await internetChecker.isConnected();
    final database = AlertDatabase();
    // await database.deleteAllAlerts();
  // TODO: REMOVE (!) FROM BELOW LINE
    if(results) {

      try {
      final response = await dioClient.get(Endpoints.allAlerts, headers: {});

      if (response.statusCode == 200) {
       for(int i=0;i<response.data.length;i++) {
          await database.insertAlert(AlertModel.fromJson(response.data[i]));

       }
        return response.data.map<AlertModel>((e) => AlertModel.fromJson(e)).toList();
      } else {
        throw NetworkExceptions.getDioException(response.data);
      }
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
    }


    }else {
     if(AppConfig.isOfflineEnabled) {
       List<AlertModel> list = await database.getAllAlerts();
      if(list.isNotEmpty) {
        return list;
      }
      throw const NetworkExceptions.noInternetConnection();

     }else {
        throw const NetworkExceptions.noInternetConnection();
     }
    }


    
  }

  @override
  Future<bool> markAsRead(
      {required MarkAlertAsReadPostModel markAlertAsReadPostModel}) async {
    try {
      final response = await dioClient.put(Endpoints.alertMarkAsRead,
          data: markAlertAsReadPostModel.toJson(), headers: {});

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }
}
