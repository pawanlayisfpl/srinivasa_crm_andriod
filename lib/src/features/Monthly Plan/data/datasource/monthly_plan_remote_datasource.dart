// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/create_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/delete_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_approve_resopsne_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/pending_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/approve_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/monthly_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/reject_monthly_plan_post_model.dart';

import '../../../../config/config.dart';
import '../../../../core/model/model.dart';
import '../../domain/model/get/monthly_plan_months_model.dart';
import '../../domain/model/get/monthly_plan_reject_response_model.dart';
import '../../domain/model/view_monthly_plan_model.dart';



abstract class MonthlyPlanRemoteDataSource {
  Future<ViewMonthlyPlanModel> getMonthlyPlans({required String selectedDate});
    Future<CreateMonthlyPlanResposneModel> createMonthlyPlan({required CreateMonthlyPlanPostModel monthlyPlanPostModel});
  Future<MonthlyPlanApprovetResponseModel> approveMonthlyPlan({required ApprovePlanPostModel approvePlanPostModel});
  Future<MonthlyPlanRejectResponseModel> rejectMonthlyPlan({required RejectMonthlyPlanPostModel rejectPlanPostModel});
  Future<List<MonthlyPlanMonthsModel>> getMonthlyPlanMonths();
  Future<List<MonthlyPlanCustomerModel>> getAssignedCustomers();
  Future<ViewMonthlyPlanModel> findMonthlyPlanByMonthlyPlanId({required int monhtlyPlanId});
  Future<DeleteMonthlyPlanResponseModel> deleteMonthlyPlanResponseModel({required int monthlyPlanid});
  Future<PendingMonthlyPlanResponseModel> getPendingMonthlyPlan();

}
// 

@Injectable(as : MonthlyPlanRemoteDataSource)
class MonthlyPlanRemoteDataSourceImpl implements MonthlyPlanRemoteDataSource {
  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final Logger logger;

  MonthlyPlanRemoteDataSourceImpl({
    required this.dioClient,
    required this.keyValueStorage,
    required this.logger,
  });

  @override
  Future<ViewMonthlyPlanModel> getMonthlyPlans({required String selectedDate}) async {
    logger.d('MONTHLY PLAN API STARTED');
    String? userId = keyValueStorage.sharedPreferences.getString(KeyValueStrings.userId);
    log('printing user id $userId');
    String id = userId ?? "";
    try {
            final dummyUrl = 'http://192.168.1.45:8080/crmsfpl/se/monthly-plan?createdDate=${selectedDate}&userId=$id';

      final url = Endpoints.getAllMonthlyPlans + selectedDate+"&userId=$id";
    final response = await dioClient.get(dummyUrl,headers: {},);
      if(response.statusCode == 200) {
            logger.d('MONTHLY PLAN API SUCCESS');
            logger.d(response.data.toString());
            ViewMonthlyPlanModel viewMonthlyPlanModel = ViewMonthlyPlanModel.fromJson(response.data);
  return viewMonthlyPlanModel;
      
      }else {
        throw NetworkExceptions.getException(response.data);
            
      }
      
    } on FormatException catch(e) {
      log(e.toString());
      throw FormatException();
    }


    
    catch(e) {

      if(e is DioException) {
      throw  NetworkExceptions.getException(e);
      }else {
        throw NetworkExceptions.badRequest();
      }
     
      
      
       

      
    }
  }
    

  
  @override
  Future<CreateMonthlyPlanResposneModel> createMonthlyPlan({required CreateMonthlyPlanPostModel monthlyPlanPostModel})  async {
    List<DailyPlanPostModel> generatedDailyPlanList = [];
    List<DailyPlanPostModel>  list() {
      for(int i =0; i< monthlyPlanPostModel.dailyPlans.length;i++) {
        DailyPlanPostModel dailyPlanPostModel = DailyPlanPostModel(createdDate: monthlyPlanPostModel.dailyPlans[i].createdDate, customerCodes: monthlyPlanPostModel.dailyPlans[i].customerCodes, approxKms: monthlyPlanPostModel.dailyPlans[i].approxKms);
        generatedDailyPlanList.add(dailyPlanPostModel);
      }
      return generatedDailyPlanList;
    }

    final bodyData = {
  "planStartDate": monthlyPlanPostModel.planStartDate,
  "planEndDate": monthlyPlanPostModel.planEndDate,
  "dailyPlans": list(),
};

    
    try {
      final response = await dioClient.post(Endpoints.monthlyPlanCreate, data: monthlyPlanPostModel.toJson(), headers: {});
      if(response.statusCode == 201) {
        return CreateMonthlyPlanResposneModel.fromJson(response.data);
      }else {
        throw NetworkExceptions.getException(response.data);
      }
    }  on DioException  catch(e)  {

      throw  NetworkExceptions.getException(e);

    
      
      
    }
  }
  
  @override
  Future<MonthlyPlanApprovetResponseModel> approveMonthlyPlan({required ApprovePlanPostModel approvePlanPostModel}) async {
    try {
      final response = await dioClient.put(Endpoints.monthlyPlanApprove,data: approvePlanPostModel.toJson(),headers: {});
      if(response.statusCode == 200) {
        return await Future.value(MonthlyPlanApprovetResponseModel.fromJson(response.data));
      }else {
        throw NetworkExceptions.getDioException(response.data);
      }
      
    }on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);      
    }
  }
  
  @override
  Future<ViewMonthlyPlanModel> findMonthlyPlanByMonthlyPlanId({required int monhtlyPlanId}) async {
    try {
      final response = await dioClient.get(Endpoints.monthlyPlanByMonthlyPlanId + monhtlyPlanId.toString(), headers: {});

      if(response.statusCode == 200) {
        return ViewMonthlyPlanModel.fromJson(response.data);
      }else {
        throw NetworkExceptions.getDioException(response.data);
      }
      
    } on DioException  catch(e) {
      throw NetworkExceptions.getDioException(e);
      
    }
  }
  
  @override
  Future<List<MonthlyPlanMonthsModel>> getMonthlyPlanMonths() async {
    try {
      final response = await dioClient.get(Endpoints.monthlyPlanMonths,headers: {});

      if(response.statusCode == 200) {
        return (response.data as List).map((e) => MonthlyPlanMonthsModel.fromJson(e)).toList();
      }else {
        throw NetworkExceptions.getDioException(response.data);
      }
      
    } on DioException  catch(e) {
      throw NetworkExceptions.getDioException(e);
      
    }
    
  }
  
  @override
  Future<MonthlyPlanRejectResponseModel> rejectMonthlyPlan({required RejectMonthlyPlanPostModel rejectPlanPostModel}) async {
    try {
      final response = await dioClient.put(Endpoints.monthlyPlanReject,data: rejectPlanPostModel.toJson(),headers: {});
      if(response.statusCode == 200) {
        return MonthlyPlanRejectResponseModel.fromJson(response.data);
      }else {
        throw NetworkExceptions.getDioException(response.data);
      }
      
    }on DioException catch (e) {
      throw NetworkExceptions.getException(e);      
    }
  }
  
  @override
  Future<List<MonthlyPlanCustomerModel>> getAssignedCustomers() async {
    try {
      final response = await dioClient.get(Endpoints.monthlyPlanCustomers,headers: {});

      if(response.statusCode == 200) {
        return  await Future.value((response.data as List).map((e) => MonthlyPlanCustomerModel.fromJson(e)).toList());
      }else {
        throw NetworkExceptions.getDioException(response.data);
      }
      
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
      
    }
  }
  
  @override
  Future<DeleteMonthlyPlanResponseModel> deleteMonthlyPlanResponseModel({required int monthlyPlanid})  async {
    try {
      final response = await dioClient.delete(Endpoints.monthlyPlanDelte + monthlyPlanid.toString(),headers: {});
      if(response.statusCode == 200) {
        return DeleteMonthlyPlanResponseModel.fromJson(response.data);
      }else {
        throw NetworkExceptions.getDioException(response.data);
      }
    } on DioException catch(e) {
      throw NetworkExceptions.getDioException(e);
  }
  
 
}

  @override
  Future<PendingMonthlyPlanResponseModel> getPendingMonthlyPlan() async {
    try {
      final response = await dioClient.get(Endpoints.monthlyPlanPendingRequests,headers: {});

      if(response.statusCode == 200) {
        return PendingMonthlyPlanResponseModel.fromJson(response.data);
      }else {
        throw NetworkExceptions.getDioException(response.data);
      }
      
    } on DioException catch(e) {
      throw NetworkExceptions.getDioException(e);
  }
}
}
  


