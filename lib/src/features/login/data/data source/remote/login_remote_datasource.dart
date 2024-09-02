// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/src/features/Profile/domain/model/profile_model.dart';



import '../../../../../config/config.dart';
import '../../../../../core/core.dart';
import '../../../../../core/model/model.dart';
import '../../../domain/models/login_post_model.dart';
import '../../../domain/models/login_response_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> login({required LoginPostModel loginPostModel});
}
@Injectable(as : LoginRemoteDataSource)
class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {

  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;

  LoginRemoteDataSourceImpl({
    required this.dioClient,
    required this.keyValueStorage,
  });

  final logger = Logger();
@override
Future<LoginResponseModel> login({required LoginPostModel loginPostModel}) async {
  try {
    logger.d('LOGIN API STARTED');
    
    final response = await dioClient.post(
      Endpoints.logingUrl,
      data: loginPostModel.toJson(),
    );

    if(response.statusCode == 200){
      logger.d('LOGIN API SUCCESS');
      final data = response.data;
      ProfileModel profileModel = ProfileModel(
        userModel: UserModel.fromJson(data['user']),
        jwt: data['token'],
        status: data['status'],

      );
    
      debugPrint('printing profile model json in login remote datasource'+ "\n\n"+profileModel.toJson().toString());
      await keyValueStorage.sharedPreferences.setString(KeyValueStrings.userId, data['user']['id'].toString());
      await keyValueStorage.sharedPreferences.setString(KeyValueStrings.userName, data['user']['username']);
      await keyValueStorage.sharedPreferences.setString(KeyValueStrings.profileDataModel, jsonEncode(profileModel));
    await  keyValueStorage.sharedPreferences.setString(KeyValueStrings.loginData, jsonEncode(data));
      return LoginResponseModel.fromJson(response.data);
    } else {
      logger.e('LOGIN API FAILED');
      throw ServerException(dioError: DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: 'Login API failed with status code: ${response.statusCode}',
      ));
    }
  
  } on DioException catch (e) {
    throw NetworkExceptions.getException(e);
  } on SocketException  {
    throw const NetworkExceptions.noInternetConnection();
  }
}
}