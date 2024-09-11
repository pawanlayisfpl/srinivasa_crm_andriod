import 'package:dartz/dartz.dart';

import '../model/profile_model.dart';


abstract class ProfileRepo {
  Future<Either<String,ProfileModel?>> getLocalUserProfile();
  Future<Either<String,bool>> saveLocalUserProfile({required ProfileModel profileModel});

}