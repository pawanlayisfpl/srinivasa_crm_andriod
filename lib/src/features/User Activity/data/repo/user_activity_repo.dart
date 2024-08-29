import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/extensions/date_extension.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network%20exception.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/data/model/get/user_activity_model.dart';

abstract class UserActivityRepo {
  Future<Either<NetworkExceptions,UserActivityModel>> getUserAcitivies({required DateTime dateTime});
}


@Injectable(as : UserActivityRepo)
class UserActivityRepoImpl implements UserActivityRepo {
  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final InternetChecker internetChecker;
  final Logger logger;

  UserActivityRepoImpl({required this.dioClient, required this.keyValueStorage, required this.internetChecker, required this.logger});


  
  @override
  Future<Either<NetworkExceptions, UserActivityModel>> getUserAcitivies({required DateTime dateTime}) async {
    logger.d('USER ACTIVITY API STARTED');
    final status = await internetChecker.isConnected();
    if(status)  {
      try {
        final response = await dioClient.get(Endpoints.userActivity,headers:  {});

        if(response.statusCode == 200) {
          logger.d('USER ACTIVITY API IS SUCCESSFUL');
          final data = response.data;
          logger.d(data.toString());
          return Right(UserActivityModel.fromJson(data));
        }else {
          logger.e('USER ACTIVITY API FAILED');
          return Left(NetworkExceptions.getDioException(response.data));
        }
        
      }on DioException catch (e) {
        logger.e('USER ACTIVITY API FAILED');
        return Left(NetworkExceptions.getDioException(e));
        
      }

    }else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

}