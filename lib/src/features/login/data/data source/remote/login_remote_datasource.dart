// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/src/config/constants/appconfig.dart';
import 'package:srinivasa_crm_new/src/features/Profile/data/datasource/local/profile_local_datasource.dart';
import 'package:srinivasa_crm_new/src/features/Profile/domain/model/profile_model.dart';
import 'package:srinivasa_crm_new/src/features/login/database/login_database.dart';



import '../../../../../config/config.dart';
import '../../../../../core/core.dart';
import '../../../../../core/model/model.dart';
import '../../../domain/models/login_post_model.dart';
import '../../../domain/models/login_response_model.dart' as lm;


abstract class LoginRemoteDataSource {
  Future<lm.LoginResponseModel> login({required LoginPostModel loginPostModel});
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
Future<lm.LoginResponseModel> login({required LoginPostModel loginPostModel}) async {
  final database = LoginPostDatabase();
  final results = await locator.get<InternetChecker>().hasInternet();
// TODO: REMOVE ! FROM IF CONDITION
  if(results) {

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  if(Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    log('Running on ${androidInfo.model}');
  }

  if(Platform.isIOS) {
    IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
  log('Running on ${iosDeviceInfo.model.toString()}');  // e.g. "iPod7,1"

  }
  



     try {
    debugPrint('LOGIN API STARTED');
    
    final response = await dioClient.post(
      Endpoints.logingUrl,
      data: loginPostModel.toJson(),
    );

    if(response.statusCode == 200){
      await database.insertLoginPost(loginPostModel);
      debugPrint('LOGIN API SUCCESS');
      final data = response.data;
      ProfileModel profileModel = ProfileModel(
        userModel: UserModel.fromJson(data['user']),
        jwt: data['token'],
        status: data['status'],

      );
    
      debugPrint('printing profile model json in login remote datasource'+ "\n\n"+profileModel.toJson().toString());
      await keyValueStorage.sharedPreferences.setString(KeyValueStrings.isLoggedIn, "yes");
      await keyValueStorage.sharedPreferences.setString(KeyValueStrings.password, loginPostModel.password.toString());
      await keyValueStorage.sharedPreferences.setString(KeyValueStrings.userId, data['user']['id'].toString());
      await keyValueStorage.sharedPreferences.setString(KeyValueStrings.userName, data['user']['username']);
      await keyValueStorage.sharedPreferences.setString(KeyValueStrings.profileDataModel, jsonEncode(profileModel));
    await  keyValueStorage.sharedPreferences.setString(KeyValueStrings.loginData, jsonEncode(data));
      return lm.LoginResponseModel.fromJson(response.data);
    } else {
      debugPrint('LOGIN API FAILED');
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

  }else {

    if(AppConfig.isOfflineEnabled) {

    final profileModel = await locator.get<ProfileLocalRepo>().getLocalUserProfile();
      log(profileModel!.toJson().toString());
 

    String? keyPassowrd = locator.get<KeyValueStorage>().getString(KeyValueStrings.password);

    String localEmail = profileModel.userModel!.email!.toLowerCase().toString();
    String localPassword = keyPassowrd!.toLowerCase().toString();

    String email = loginPostModel.email!.toLowerCase().toString();
    String password = loginPostModel.password!.toLowerCase().toString();

    if(localEmail == email && localPassword == password)  {
      // LOCAL EMAIL AND PASSWORD MATCHESS

      lm.LoginResponseModel loginResponseModel = lm.LoginResponseModel(
        jwt: profileModel.jwt,
        user: lm.User(
          authorities: profileModel.userModel!.authorities!.map((e) => lm.Authorities(

          )).toList(),
          divisionId: profileModel.userModel!.divisionId,
          email: profileModel.userModel!.email,
          id: profileModel.userModel!.id,
          roleId: profileModel.userModel!.roleId,
          zones: profileModel.userModel!.zones!.map((e) => lm.Zones(id: e.id,zoneName: e.zoneName)).toList(),
        
        )
      );
      return loginResponseModel;

    }else if(localEmail != email && localPassword == password) {
      // EMAIL IS INCORRECT
      const responseBody = {
        "message" : "Email is incorrect",
        "status" : false,
      };
        // Creating a response object to pass to DioException
  final response = Response(
    requestOptions: RequestOptions(path: ''), // Specify the actual request path
    data: responseBody,
    statusCode: 400, // You can use an appropriate status code for "Email incorrect"
  );


      throw NetworkExceptions.getDioException(DioException(
    requestOptions: RequestOptions(path: ''), // Specify the request path
    response: response,
    type: DioExceptionType.unknown // You can specify the type of error
  ));
    }else if(localEmail == email && localPassword != password) {
      // PASSWORD IS INCORRECT
        // EMAIL IS INCORRECT
      const responseBody = {
        "message" : "Password is incorrect",
        "status" : false,
      };
        // Creating a response object to pass to DioException
  final response = Response(
    requestOptions: RequestOptions(path: ''), // Specify the actual request path
    data: responseBody,
    statusCode: 400, // You can use an appropriate status code for "Email incorrect"
  );


      throw NetworkExceptions.getDioException(DioException(
    requestOptions: RequestOptions(path: ''), // Specify the request path
    response: response,
    type: DioExceptionType.unknown // You can specify the type of error
  ));
    }
    
    else {
      // BOTH EMAIL AND PASSWORD IS INCORRECT
        // EMAIL IS INCORRECT
      const responseBody = {
        "message" : "Email and Password incorrect",
        "status" : false,
      };
        // Creating a response object to pass to DioException
  final response = Response(
    requestOptions: RequestOptions(path: ''), // Specify the actual request path
    data: responseBody,
    statusCode: 400, // You can use an appropriate status code for "Email incorrect"
  );


      throw NetworkExceptions.getDioException(DioException(
    requestOptions: RequestOptions(path: ''), // Specify the request path
    response: response,
    type: DioExceptionType.unknown // You can specify the type of error
  ));

    }

    }else {
      throw const NetworkExceptions.noInternetConnection();
    }
    

  }
 
}
}