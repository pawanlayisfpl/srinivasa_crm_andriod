
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network%20exception.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/create_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/delete_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_approve_resopsne_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_months_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_reject_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_search_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/pending_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/update_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/approve_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/monthly_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/reject_monthly_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/update_monthlyplan_postmodel.dart';

import '../../domain/model/view_monthly_plan_model.dart';
import '../../domain/repo/monthly_plan_repo.dart';
import '../datasource/monthly_plan_remote_datasource.dart';

@Injectable(as : MonthlyPlanRepo)
class MonthlyPlanRepoImpl implements MonthlyPlanRepo {
  final MonthlyPlanRemoteDataSource remoteDataSource;

  MonthlyPlanRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<NetworkExceptions, ViewMonthlyPlanModel>> getMonthlyPlans({required String selectedDate}) async {
    try {
      final monthlyPlans = await remoteDataSource.getMonthlyPlans(selectedDate: selectedDate);
      return Right(monthlyPlans);
    }on NetworkExceptions catch(e) {
      return Left(e);
    }
   
  }

  @override
  Future<Either<NetworkExceptions, CreateMonthlyPlanResposneModel>> createMonthlyPlan({required CreateMonthlyPlanPostModel monthlyPlanPostModel}) async {
    try {
      final isCreated = await remoteDataSource.createMonthlyPlan(monthlyPlanPostModel: monthlyPlanPostModel);
      return Right(isCreated);
    }on NetworkExceptions catch(e) {
      return Left(e);
    }
   
  }


  @override
  Future<Either<NetworkExceptions, UpdateMonthlyPlanResponseModel>> updateMonthlyPlan({required UpdateMonthlyPlanPostModel updateMonthlyPlanPostModel})  async {
    try {
      final results = await remoteDataSource.updateMonthlyPlan(updateMonthlyPlanPostModel: updateMonthlyPlanPostModel);
      return Right(results);
    }on NetworkExceptions catch(e) {
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkExceptions, MonthlyPlanApprovetResponseModel>> approveMonthlyPlan({required ApprovePlanPostModel approvePlanPostModel}) async {
    try {
      final isApproved = await remoteDataSource.approveMonthlyPlan(approvePlanPostModel: approvePlanPostModel);
      return Right(isApproved);
    }on NetworkExceptions catch(e) {
      return Left(e);
    }      
  }

  @override
  Future<Either<NetworkExceptions, DeleteMonthlyPlanResponseModel>> deleteMonthlyPlanResponseModel({required int monthlyPlanid}) async {
    // try {
    //   final isDeleted = await remoteDataSource.deleteMonthlyPlanResponseModel(monthlyPlanid: monthlyPlanid);
    //   return Right(isDeleted);
    // }on NetworkExceptions catch(e) {
    //   return Left(e);
    // }
    throw UnimplementedError();
  }


  @override
  Future<Either<NetworkExceptions, List<MonthlyPlanCustomerModel>>> getAssignedCustomers() async {
    try {
      final assignedCustomers = await remoteDataSource.getAssignedCustomers();
      return Right(assignedCustomers);
    }on NetworkExceptions catch(e) {
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkExceptions, List<MonthlyPlanMonthsModel>>> getMonthlyPlanMonths({required String userId}) async {
    try {
      final monthlyPlanMonths = await remoteDataSource.getMonthlyPlanMonths(userId: userId);
      return Right(monthlyPlanMonths);
    }on NetworkExceptions catch(e) {
      return Left(e);
    }
 
  }

  @override
  Future<Either<NetworkExceptions, MonthlyPlanRejectResponseModel>> rejectMonthlyPlan({required RejectMonthlyPlanPostModel rejectMonthlyPlanPostModel}) async {

    try {
      final isRejected = await remoteDataSource.rejectMonthlyPlan(rejectPlanPostModel: rejectMonthlyPlanPostModel);
      return Right(isRejected);
    }on NetworkExceptions catch(e) {
      return Left(e);
    }
   
  }
  
  @override
  Future<Either<NetworkExceptions, ViewMonthlyPlanModel>> findMonthlyPlanByMonthlyPlanId({required int monthlyPlanId}) async {
    try {
      final monthlyPlan = await remoteDataSource.findMonthlyPlanByMonthlyPlanId(monhtlyPlanId: monthlyPlanId);
      return Right(monthlyPlan);
    }on NetworkExceptions catch(e) {
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkExceptions, PendingMonthlyPlanResponseModel>> getPendingMonthlyPlan()  async {
    try {
      final pendingMonthlyPlan = await remoteDataSource.getPendingMonthlyPlan();
      return Right(pendingMonthlyPlan);
      
    } on NetworkExceptions catch (e) {
      throw Left(e);
      
    }
  }

  @override
  Future<Either<NetworkExceptions, MonthlyPlanSearchResponseModel>> searchMonthlyPlanUser({required String search}) async  {
    try {
    final results = await  remoteDataSource.searchMonthlyPlanUser(query: search);
    return right(results);
     
   } on NetworkExceptions catch (e) {
    return left(e);
     
   }
  }
}