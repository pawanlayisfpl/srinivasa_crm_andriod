import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/model/get/daily_plan_resposne_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/model/post/daily_plan_postModel.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/model/post/update_dailyplan_postmodel.dart';

import '../model/post/delete_dailyplan_postmodel.dart';

abstract class DailyPlanRepo {
  Future<Either<NetworkExceptions,DailyPlanResponseModel>> createDailyPlan({required DailyPlanCreateModel dailyPlanPostModel});
  Future<Either<NetworkExceptions,DailyPlanResponseModel>> updateDailyPlan({required UpdateDailyPlanPostModel updateDailyPlanPostModel});
  Future<Either<NetworkExceptions,DailyPlanResponseModel>> deleteDailyPlan({required DailyplanDeletePostModel dailyPlanDeletePostModel});

}

@Injectable(as:  DailyPlanRepo)
class DailyPlanRepoImpl extends DailyPlanRepo {
  final DioClient dioClient;

  DailyPlanRepoImpl({required this.dioClient});


  @override
  Future<Either<NetworkExceptions, DailyPlanResponseModel>> createDailyPlan({required DailyPlanCreateModel dailyPlanPostModel}) async {
    try {
      final response = await dioClient.post(Endpoints.createDailyPlan,data: dailyPlanPostModel,headers: {});

      if(response.statusCode == 201) {
        return right(DailyPlanResponseModel.fromJson(response.data));

      }else {
        return left(NetworkExceptions.getDioException(response.data));
      }
      
    }on DioException catch (e) {
    return left(NetworkExceptions.getDioException(e));
      
    }
  }
  
  @override
  Future<Either<NetworkExceptions, DailyPlanResponseModel>> updateDailyPlan({required UpdateDailyPlanPostModel updateDailyPlanPostModel}) async {
   try {
      final response = await dioClient.put(Endpoints.createDailyPlan,data: updateDailyPlanPostModel,headers: {});
  
      if(response.statusCode == 201) {
        return right(DailyPlanResponseModel.fromJson(response.data));
      }else {
        return left(NetworkExceptions.getDioException(response.data));
      }
     
   } on DioException catch (e) {
    return left(NetworkExceptions.getDioException(e));
     
   }
  }
  
  @override
  Future<Either<NetworkExceptions, DailyPlanResponseModel>> deleteDailyPlan({required DailyplanDeletePostModel dailyPlanDeletePostModel}) async {

  try {
    final response = await dioClient.delete(Endpoints.createDailyPlan,data: dailyPlanDeletePostModel,headers: {});

    if(response.statusCode == 200) {
      return right(DailyPlanResponseModel.fromJson(response.data));
    }else {
      return left(NetworkExceptions.getDioException(response.data));
    }
    
  } on DioException catch (e) {
    return left(NetworkExceptions.getDioException(e));
  }
  }
}