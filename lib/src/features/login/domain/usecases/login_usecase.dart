import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/features/login/domain/models/login_response_model.dart';

import '../../../../core/model/model.dart';
import '../models/login_post_model.dart';
import '../repository/login_repo.dart';


@injectable
class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});


  Future<Either<NetworkExceptions,LoginResponseModel>> execute({required LoginPostModel loginPostModel}) async {
    return await loginRepository.login(loginPostModel: loginPostModel);
  }


  


}