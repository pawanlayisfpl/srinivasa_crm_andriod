// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';

import 'package:srinivasa_crm_new/src/core/core.dart';

import '../../../domain/model/profile_model.dart';

abstract class ProfileLocalRepo {
  Future<ProfileModel?> getLocalUserProfile();
  Future<bool> saveLocalUserProfile({required ProfileModel profileModel});
}


@Injectable(as : ProfileLocalRepo)
class ProfileRepoImpl implements ProfileLocalRepo {
  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final Logger logger;
  ProfileRepoImpl({
    required this.dioClient,
    required this.keyValueStorage,
    required this.logger,
  });
  
  @override
  Future<ProfileModel?> getLocalUserProfile() async {
    try {
      final profileData = keyValueStorage.sharedPreferences.getString(
        KeyValueStrings.profileDataModel,
      );
      if (profileData != null) {
var decodedData = jsonDecode(profileData);
var user = decodedData['user']; // Fetch the 'user' field

ProfileModel profileModel = ProfileModel(
  jwt: decodedData['jwt'],
  userModel: UserModel.fromJson(user),
  status: decodedData['status'],
);



     return profileModel;
      } else {
        throw Exception('No data found');
      }
    } catch (e) {
     throw Exception(e.toString());
    }
  }
  
  @override
  Future<bool> saveLocalUserProfile({required ProfileModel profileModel})  async {
   try {
      await keyValueStorage.sharedPreferences.setString(
       KeyValueStrings.profileDataModel,
        jsonEncode(profileModel),
      );
      return true;
     
   } catch (e) {
      logger.e(e);
      throw Exception(e.toString());
     
   }
  }
}
