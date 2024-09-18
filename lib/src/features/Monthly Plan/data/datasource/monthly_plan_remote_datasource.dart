// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/database/create_monthly_plan_database.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/database/months_database.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/database/view_monthly_plan_database.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/create_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/delete_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_approve_resopsne_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/pending_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/update_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/approve_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/monthly_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/reject_monthly_plan_post_model.dart';

import '../../../../config/config.dart';
import '../../../../core/model/model.dart';
import '../../domain/model/get/monthly_plan_months_model.dart';
import '../../domain/model/get/monthly_plan_reject_response_model.dart';
import '../../domain/model/get/monthly_plan_search_response_model.dart';
import '../../domain/model/post/update_monthlyplan_postmodel.dart';
import '../../domain/model/view_monthly_plan_model.dart';

abstract class MonthlyPlanRemoteDataSource {
  Future<ViewMonthlyPlanModel> getMonthlyPlans({required String selectedDate});
  Future<CreateMonthlyPlanResposneModel> createMonthlyPlan(
      {required CreateMonthlyPlanPostModel monthlyPlanPostModel});
  Future<MonthlyPlanApprovetResponseModel> approveMonthlyPlan(
      {required ApprovePlanPostModel approvePlanPostModel});
  Future<MonthlyPlanRejectResponseModel> rejectMonthlyPlan(
      {required RejectMonthlyPlanPostModel rejectPlanPostModel});
  Future<List<MonthlyPlanMonthsModel>> getMonthlyPlanMonths(
      {required String userId});
  Future<List<MonthlyPlanCustomerModel>> getAssignedCustomers();
  Future<ViewMonthlyPlanModel> findMonthlyPlanByMonthlyPlanId(
      {required int monhtlyPlanId});
  Future<DeleteMonthlyPlanResponseModel> deleteMonthlyPlanResponseModel(
      {required int monthlyPlanid});
  Future<PendingMonthlyPlanResponseModel> getPendingMonthlyPlan();
  Future<MonthlyPlanSearchResponseModel> searchMonthlyPlanUser(
      {required String query});
  Future<UpdateMonthlyPlanResponseModel> updateMonthlyPlan(
      {required UpdateMonthlyPlanPostModel updateMonthlyPlanPostModel});
}
//

@Injectable(as: MonthlyPlanRemoteDataSource)
class MonthlyPlanRemoteDataSourceImpl implements MonthlyPlanRemoteDataSource {
  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final Logger logger;
  final InternetChecker internetChecker;

  MonthlyPlanRemoteDataSourceImpl({
    required this.dioClient,
    required this.keyValueStorage,
    required this.logger,
    required this.internetChecker,
  });

  @override
  Future<ViewMonthlyPlanModel> getMonthlyPlans(
      {required String selectedDate}) async {
    logger.d('MONTHLY PLAN API STARTED');
    String? userId =
        keyValueStorage.sharedPreferences.getString(KeyValueStrings.userId);
    debugPrint('printing user id $userId');
    String id = userId ?? "";
    try {
      final dummyUrl =
          'http://192.168.1.45:8080/crmsfpl/se/monthly-plan?createdDate=${selectedDate}&userId=$id';

      final url = Endpoints.getAllMonthlyPlans + selectedDate + "&userId=$id";
      final response = await dioClient.get(
        dummyUrl,
        headers: {},
      );
      if (response.statusCode == 200) {
        logger.d('MONTHLY PLAN API SUCCESS');
        logger.d(response.data.toString());
        ViewMonthlyPlanModel viewMonthlyPlanModel =
            ViewMonthlyPlanModel.fromJson(response.data);
        return viewMonthlyPlanModel;
      } else {
        throw NetworkExceptions.getException(response.data);
      }
    } on FormatException catch (e) {
      debugPrint(e.toString());
      throw const FormatException();
    } catch (e) {
      if (e is DioException) {
        throw NetworkExceptions.getException(e);
      } else {
        throw const NetworkExceptions.badRequest();
      }
    }
  }

  @override
  Future<CreateMonthlyPlanResposneModel> createMonthlyPlan(
      {required CreateMonthlyPlanPostModel monthlyPlanPostModel}) async {
    final results = await internetChecker.hasInternet();
    final database = CreateMonthlyPlanPostDatabase();
    // TODO: REMOVE (!) FROM BELOW LINE
    if (results) {
      List<DailyPlanPostModel> generatedDailyPlanList = [];
      List<DailyPlanPostModel> list() {
        for (int i = 0; i < monthlyPlanPostModel.dailyPlans.length; i++) {
          DailyPlanPostModel dailyPlanPostModel = DailyPlanPostModel(
              createdDate: monthlyPlanPostModel.dailyPlans[i].createdDate,
              farmIds: monthlyPlanPostModel.dailyPlans[i].farmIds,
              approxKms: monthlyPlanPostModel.dailyPlans[i].approxKms);
          generatedDailyPlanList.add(dailyPlanPostModel);
        }
        return generatedDailyPlanList;
      }

      try {
        final response = await dioClient.post(Endpoints.monthlyPlanCreate,
            data: monthlyPlanPostModel.toJson(), headers: {});
        if (response.statusCode == 201) {
          return CreateMonthlyPlanResposneModel.fromJson(response.data);
        } else {
          throw NetworkExceptions.getException(response.data);
        }
      } on DioException catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      final id = await database.insertMonthlyPlan(monthlyPlanPostModel);
      if (id != 0) {
        CreateMonthlyPlanPostModel? plan = await database.getMonthlyPlan(id);

        if (plan != null) {
          log('plan is successfully inserted in local storage of mobile');
        } else {
          log('plan is not inserted in local storage of mobile');
        }

        return CreateMonthlyPlanResposneModel(
            message: 'Monthly Plan Created Successfully', status: true);
      } else {
        throw const NetworkExceptions.noInternetConnection();
      }
    }
  }

  @override
  Future<MonthlyPlanApprovetResponseModel> approveMonthlyPlan(
      {required ApprovePlanPostModel approvePlanPostModel}) async {
    try {
      final response = await dioClient.put(Endpoints.monthlyPlanApprove,
          data: approvePlanPostModel.toJson(), headers: {});
      if (response.statusCode == 200) {
        return await Future.value(
            MonthlyPlanApprovetResponseModel.fromJson(response.data));
      } else {
        throw NetworkExceptions.getDioException(response.data);
      }
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  @override
  Future<ViewMonthlyPlanModel> findMonthlyPlanByMonthlyPlanId(
      {required int monhtlyPlanId}) async {
    final results = await internetChecker.hasInternet();
    final database = ViewMonthlyPlanDatabase();

    if (results) {
      try {
        final response = await dioClient.get(
            Endpoints.monthlyPlanByMonthlyPlanId + monhtlyPlanId.toString(),
            headers: {});

        if (response.statusCode == 200) {
          final viewMonthlyPlan = ViewMonthlyPlanModel.fromJson(response.data);
          await database.insertViewMonthlyPlan(viewMonthlyPlan);
          return viewMonthlyPlan;
        } else {
          throw NetworkExceptions.getDioException(response.data);
        }
      } on DioException catch (e) {
        throw NetworkExceptions.getDioException(e);
      }
    } else {
      ViewMonthlyPlanModel? viewMonthlyPlanModel =
          await database.getViewMonthlyPlanByMonthlyPlanId(
              int.parse(monhtlyPlanId.toString()));
// Ensure the list is mutable
      return viewMonthlyPlanModel!;
    }
  }

  @override
  Future<List<MonthlyPlanMonthsModel>> getMonthlyPlanMonths(
      {required String userId}) async {
    final results = await internetChecker.hasInternet();
    final database = MonthlyPlanMonthsDatabase();
// TODO: REMOVE (!) FROM BELOW LINE
    if (results) {
      try {
        final response = await dioClient
            .get(Endpoints.monthlyPlanMonths + userId, headers: {});

        if (response.statusCode == 200) {
          await database.deleteAllMonthlyPlanMonths();

          for (int i = 0; i < response.data.length; i++) {
            MonthlyPlanMonthsModel monthlyPlanMonthsModel =
                MonthlyPlanMonthsModel.fromJson(response.data[i]);
            await database.insertMonthlyPlanMonth(monthlyPlanMonthsModel);
          }
          return (response.data as List)
              .map((e) => MonthlyPlanMonthsModel.fromJson(e))
              .toList();
        } else {
          throw NetworkExceptions.getDioException(response.data);
        }
      } on DioException catch (e) {
        throw NetworkExceptions.getDioException(e);
      }
    } else {
      List<MonthlyPlanMonthsModel> monthlyPlanMonths =
          await database.getAllMonthlyPlanMonths();
      return monthlyPlanMonths;
    }
  }

  @override
  Future<MonthlyPlanRejectResponseModel> rejectMonthlyPlan(
      {required RejectMonthlyPlanPostModel rejectPlanPostModel}) async {
    try {
      final response = await dioClient.put(Endpoints.monthlyPlanReject,
          data: rejectPlanPostModel.toJson(), headers: {});
      if (response.statusCode == 200) {
        return MonthlyPlanRejectResponseModel.fromJson(response.data);
      } else {
        throw NetworkExceptions.getDioException(response.data);
      }
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<List<MonthlyPlanCustomerModel>> getAssignedCustomers() async {
    try {
      final response =
          await dioClient.get(Endpoints.monthlyPlanCustomers, headers: {});

      if (response.statusCode == 200) {
        return await Future.value((response.data as List)
            .map((e) => MonthlyPlanCustomerModel.fromJson(e))
            .toList());
      } else {
        throw NetworkExceptions.getDioException(response.data);
      }
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  @override
  Future<DeleteMonthlyPlanResponseModel> deleteMonthlyPlanResponseModel(
      {required int monthlyPlanid}) async {
    var bodyData = {"monthlyPlanId": monthlyPlanid};
    try {
      final response = await dioClient
          .delete(Endpoints.monthlyPlanDelte, data: bodyData, headers: {});
      if (response.statusCode == 200) {
        return DeleteMonthlyPlanResponseModel.fromJson(response.data);
      } else {
        throw NetworkExceptions.getDioException(response.data);
      }
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  @override
  Future<PendingMonthlyPlanResponseModel> getPendingMonthlyPlan() async {
    try {
      final response = await dioClient
          .get(Endpoints.monthlyPlanPendingRequests, headers: {});

      if (response.statusCode == 200) {
        return PendingMonthlyPlanResponseModel.fromJson(response.data);
      } else {
        throw NetworkExceptions.getDioException(response.data);
      }
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  @override
  Future<MonthlyPlanSearchResponseModel> searchMonthlyPlanUser(
      {required String query}) async {
    try {
      final response =
          await dioClient.get(Endpoints.monthlyPlanSearch + query, headers: {});

      if (response.statusCode == 200) {
        return Future.value(
            MonthlyPlanSearchResponseModel.fromJson(response.data));
      } else {
        throw Future.value(NetworkExceptions.getDioException(response.data));
      }
    } on DioException catch (e) {
      throw Future.error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<UpdateMonthlyPlanResponseModel> updateMonthlyPlan(
      {required UpdateMonthlyPlanPostModel updateMonthlyPlanPostModel}) async {
    try {
      final response = await dioClient.put(Endpoints.monthlyPlanUpdate,
          data: updateMonthlyPlanPostModel.toJson(), headers: {});
      if (response.statusCode == 200) {
        return UpdateMonthlyPlanResponseModel.fromJson(response.data);
      } else {
        throw NetworkExceptions.getDioException(response.data);
      }
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }
}
