import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';

// Service Locator of the app. Use this locator to find registered types
final locator = GetIt.instance;

/// Initialization function for the service locator of the app.
/// Call this function before runApp to register dependencies
// @injectableInit
@injectableInit
Future<void> registerDependencies(String env) async {
  await locator.init(environment: env);
}

@module
abstract class ThirdPartyDependencies {
  // @singleton
  // Client get httpClient {
  //   final c = HttpClient();
  //   if (kDebugMode) {
  //     c.badCertificateCallback = (_, __, ___) => true;
  //   }
  //   return IOClient(c);
  // }

  @singleton
  Dio get dio => Dio(
        
  ); // Register Dio

  @singleton
  Logger get logger => Logger(
        level: kDebugMode ? Level.debug : Level.debug,
      );

  @singleton
  Connectivity get connectivity => Connectivity();

  @singleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @singleton
  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  @singleton
  // ignore: invalid_annotation_target
  @preResolve
  // Future<SharedPreferences> get sharedPreferences =>
  //     SharedPreferences.getInstance();
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance(); // Register SharedPreferences

  @factory
  DateTime get defaultDateTime => DateTime.now();
}

Future<void> register<T extends Object>(T value) async {
  if (locator.isRegistered<T>()) {
    await locator.unregister<T>();
  }

  locator.registerSingleton(value);
}
