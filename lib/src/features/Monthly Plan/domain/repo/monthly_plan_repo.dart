import 'package:dartz/dartz.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network%20exception.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/create_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/delete_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_approve_resopsne_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_months_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_reject_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_search_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/update_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/approve_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/monthly_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/reject_monthly_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/update_monthlyplan_postmodel.dart';

import '../model/get/pending_monthly_plan_response_model.dart';
import '../model/view_monthly_plan_model.dart';


abstract class MonthlyPlanRepo {
  Future<Either<NetworkExceptions,ViewMonthlyPlanModel>> getMonthlyPlans({required String selectedDate});
  Future<Either<NetworkExceptions, CreateMonthlyPlanResposneModel>> createMonthlyPlan({required CreateMonthlyPlanPostModel monthlyPlanPostModel});
  Future<Either<NetworkExceptions, UpdateMonthlyPlanResponseModel>> updateMonthlyPlan({required UpdateMonthlyPlanPostModel updateMonthlyPlanPostModel});
  Future<Either<NetworkExceptions,MonthlyPlanApprovetResponseModel>> approveMonthlyPlan({required ApprovePlanPostModel approvePlanPostModel});
  Future<Either<NetworkExceptions,MonthlyPlanRejectResponseModel>> rejectMonthlyPlan({required RejectMonthlyPlanPostModel rejectMonthlyPlanPostModel});
  Future<Either<NetworkExceptions,List<MonthlyPlanMonthsModel>>> getMonthlyPlanMonths({required String userId});
    Future<Either<NetworkExceptions,ViewMonthlyPlanModel>> findMonthlyPlanByMonthlyPlanId({required int monthlyPlanId});

  Future<Either<NetworkExceptions,List<MonthlyPlanCustomerModel>>> getAssignedCustomers();
  Future<Either<NetworkExceptions,DeleteMonthlyPlanResponseModel>> deleteMonthlyPlanResponseModel({required int monthlyPlanid});
  Future<Either<NetworkExceptions,PendingMonthlyPlanResponseModel>> getPendingMonthlyPlan();
  Future<Either<NetworkExceptions,MonthlyPlanSearchResponseModel>> searchMonthlyPlanUser({required String search});

}