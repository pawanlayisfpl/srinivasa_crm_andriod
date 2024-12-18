import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Forget%20Password/forget_password_repo.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network_exception.dart';
import 'package:srinivasa_crm_new/src/features/login/domain/models/update_password_post_model.dart';
import 'package:srinivasa_crm_new/src/features/login/domain/models/update_password_resposne_model.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPassRepoImpl implements ForgetPasswordRepo {
  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final InternetChecker internetChecker;

  ForgetPassRepoImpl({required this.dioClient, required this.keyValueStorage, required this.internetChecker});
  @override
  Future<Either<NetworkExceptions, FindEmailResponseModel>> findEmail({required FindEmailPostModel findEmailPostModel})  async{


   try {
     final response = await dioClient.post(Endpoints.findEmail,data: {
      "email" : findEmailPostModel.email
     });
     if(response.statusCode == 200) {
      await keyValueStorage.sharedPreferences.setString(KeyValueStrings.forgetEmail, findEmailPostModel.email.toString());

      FindEmailResponseModel findEmailResponseModel = FindEmailResponseModel.fromJson(response.data);
      return right(findEmailResponseModel);

     }else {
      return left(NetworkExceptions.getDioException(response.data));
     }
   }on DioException catch (e) {
    return left(NetworkExceptions.getDioException(e));
     
   }
  }

  @override
  Future<Either<NetworkExceptions, ResetPassResponseModel>> resetPass({required ResetPassPostModel resetPassPostModel}) async {
   try {
     final response = await dioClient.post(Endpoints.resetPassword,data: resetPassPostModel);
     if(response.statusCode == 200) {

      ResetPassResponseModel resetPassResponseModel = ResetPassResponseModel.fromJson(response.data);
      return right(resetPassResponseModel);

     }else {
      return left(NetworkExceptions.getDioException(response.data));
     }
   }on DioException catch (e) {
    return Left(NetworkExceptions.getDioException(e));
     
   }
  }

  @override
  Future<Either<NetworkExceptions, UpdatePasswordResponseModel>> updatePassword({required UpdatePassPostModel updatePassPostModel}) async {
    final status = await internetChecker.hasInternet();
    if(status) {
      try {
        final response = await dioClient.put(Endpoints.updatePassword,data: updatePassPostModel,headers: {});
        if(response.statusCode == 200) {
          UpdatePasswordResponseModel updatePasswordResponseModel = UpdatePasswordResponseModel.fromJson(response.data);
          return right(updatePasswordResponseModel);
        }else {
          return left(NetworkExceptions.getDioException(response.data));
        }
      }on DioException catch (e) {
        return left(NetworkExceptions.getDioException(e));
      }
  }else {
    return left(const NetworkExceptions.noInternetConnection());
  }
  }


}