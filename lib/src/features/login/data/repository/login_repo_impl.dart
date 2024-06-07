

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/features/login/data/data%20source/remote/login_remote_datasource.dart';

import '../../../../core/model/model.dart';
import '../../domain/models/login_post_model.dart';
import '../../domain/models/login_response_model.dart';
import '../../domain/repository/login_repo.dart';


@Injectable(as: LoginRepository)
class LoginRepoImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl({required this.loginRemoteDataSource});
  @override
  Future<Either<NetworkExceptions, LoginResponseModel>> login({required LoginPostModel loginPostModel}) async {
    try {
      final result = await loginRemoteDataSource.login(loginPostModel: loginPostModel);
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    }
  }
  
}