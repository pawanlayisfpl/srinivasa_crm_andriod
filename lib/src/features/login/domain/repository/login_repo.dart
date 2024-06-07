
import 'package:dartz/dartz.dart';

import '../../../../core/model/model.dart';
import '../models/login_post_model.dart';
import '../models/login_response_model.dart';

abstract class LoginRepository {
  Future<Either<NetworkExceptions, LoginResponseModel>> login(
      {required LoginPostModel loginPostModel});
}