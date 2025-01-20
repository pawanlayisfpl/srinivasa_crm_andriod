// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../config/config.dart';
import '../storage/key_value_storage.dart';
import 'endpoints.dart';

@injectable
class DioClient {
  final Dio _dio;
  final KeyValueStorage keyValueStorage;
  final Logger logger;

  DioClient(
    this._dio,
    this.keyValueStorage,
    this.logger,
  ) {
    _dio
      ..options.baseUrl = Endpoints.basicUrl
      ..options.connectTimeout =
          const Duration(seconds: Endpoints.connectionTimeout)
      //10-seconds
      ..options.receiveTimeout =
          const Duration(seconds: Endpoints.receiveTimeout)
      //10-seconds
      ..options.responseType = ResponseType.json;

          // Add PrettyDioLogger interceptor
    // _dio.interceptors.add(PrettyDioLogger(

    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: false,
    //   responseHeader: false,
    //   error: true,
    //   compact: true,
    //   maxWidth: 90,
    //   filter: (options, args) {
    //     // don't print requests with uris containing '/posts'
    //     if (options.path.contains('/posts') || options.path.contains('/post')) {
    //       return false;
    //     }
    //     // don't print responses with unit8 list data
    //     return !args.isResponse || !args.hasUint8ListData;
    //   },
    // ));


    // Check if PrettyDioLogger is already added
    if (!_dio.interceptors.any((i) => i is PrettyDioLogger)) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ));
    }

      
  }


  // //! CREATING GET, POST, PUT, DELETE REQUESTS

  // //* Get Method:--------------------------------------------------------------------------------------------------------------------
  // Future<Response> get(String url,
  //     {Map<String, dynamic>? queryParameters,
  //     Options? options,
  //     CancelToken? cancelToken,
  //       Map<String,dynamic>? headers,

  //     ProgressCallback? progressCallback}) async {
  //   try {
  //      final  String? getToken = keyValueStorage.getString(KeyValueStrings.token);
  // String token = getToken ?? '';

  // headers = headers != null ? {
  //   "Authorization" : 'Bearer $token'
  // } : {};
  //     final Response response = await _dio.get(
  //       url,
  //       queryParameters: queryParameters,
  //       options: Options(
  //         contentType: ContentType.json.toString(),
  //         headers: headers,
  //       ),
  //       onReceiveProgress: progressCallback,
  //     );

  //     return  response;
  //   } on DioException {
  //     rethrow;
  //   }catch(e){
  //     rethrow;
  //   }
  // }


   //! CREATING GET, POST, PUT, DELETE REQUESTS

  //* Get Method:--------------------------------------------------------------------------------------------------------------------
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      Map<String, dynamic>? headers,
      ProgressCallback? progressCallback}) async {
    try {
      final String? getToken = keyValueStorage.getString(KeyValueStrings.token);
      String token = getToken ?? '';

      headers = headers != null
          ? {
              "Authorization": 'Bearer $token',
            }
          : {};
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          contentType: ContentType.json.toString(),
          headers: headers,
        ),
        onReceiveProgress: progressCallback,
      );

      return response;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }




Future<Response> post(
  String url, {
  data,
  Map<String,dynamic>? headers,
  Map<String, dynamic>? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
}) async {
  final  String? getToken = keyValueStorage.getString(KeyValueStrings.token);
  String token = getToken ?? '';

  headers = headers != null ? {
    "Authorization" : 'Bearer $token'
  } : {};
  
  // debugPrint("Headers: $headers");

  try {
    final Response response = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(
          contentType: ContentType.json.toString(),
          headers: headers),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  } on DioException  {
rethrow;
  }
}



Future<Response> put(
  String url, {
  data,
  Map<String,dynamic>? headers,
  Map<String, dynamic>? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
}) async {
  final  String? getToken = keyValueStorage.getString(KeyValueStrings.token);
  String token = getToken ?? '';

  headers = headers != null ? {
    "Authorization" : 'Bearer $token'
  } : {};
  
  // debugPrint("Headers: $headers");

  try {
    final Response response = await _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(
          contentType: ContentType.json.toString(),
          headers: headers),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  } on DioException  {
rethrow;
  }
}
 
  //* patch(UPDATE) Method:----------------------------------------------------------------------------------------------------------------

  Future<Response> patch(
    String url, {
    data,
      Map<String,dynamic>? headers,

    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
 final  String? getToken = keyValueStorage.getString(KeyValueStrings.token);
  String token = getToken ?? '';

  headers = headers != null ? {
    "Authorization" : 'Bearer $token'
  } : {};
  
  // debugPrint("Headers: $headers");
    try {
      final Response response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
            contentType: ContentType.json.toString(),
            headers: headers),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  
  //* Delete Method:----------------------------------------------------------------------------------------------------------------

  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
      Map<String,dynamic>? headers,

    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
     final  String? getToken = keyValueStorage.getString(KeyValueStrings.token);
  String token = getToken ?? '';

  headers = headers != null ? {
    "Authorization" : 'Bearer $token'
  } : {};
  

    try {
      final Response response = await _dio.delete(url,
          data: data,
          queryParameters: queryParameters,
          options: Options(
              contentType: ContentType.json.toString(),
              headers: {"Authorization": "Bearer $token"}),
          cancelToken: cancelToken);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //* Form-data Method:--------------------------------------------------------------------------------------------------------------------
  Future<Response> formData(
    String url, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    String? token = keyValueStorage.getString(SharedPrefenceskeys.token);

    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType: ContentType.json.toString(),
          headers: {
            HttpHeaders.contentTypeHeader: 'multipart/form-data',
            'Authorization': 'Bearer $token',
          },
        ),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //! form-data put
  Future<Response> formDataput(
    String url, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    String? token = keyValueStorage.getString(SharedPrefenceskeys.token);

    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType: ContentType.json.toString(),
          headers: {
            HttpHeaders.contentTypeHeader: 'multipart/form-data',
            'Authorization': 'Bearer $token',
          },
        ),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
