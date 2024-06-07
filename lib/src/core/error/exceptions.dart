 import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage, String? error});
}


class ServerException extends DioException {
  ServerException({ required DioException dioError})
      : super(
          requestOptions: dioError.requestOptions,
          response: dioError.response,
          type: dioError.type,
          error: dioError.error,
        ) {
    debugPrint('ServerException thrown with DioException: $dioError');
  }
}

class CacheException implements Exception {
  final String errorMessage;
  CacheException({required this.errorMessage});
}
