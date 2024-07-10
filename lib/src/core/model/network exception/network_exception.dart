import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/config/locator/locator.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/login/presentation/screens/login_screen.dart';

import '../../../config/constants/app_keys.dart';

part 'network_exception.freezed.dart';
@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest() = UnauthorisedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(DioException dioException) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions getDioException(DioException error) {

   // Check for a 401 Unauthorized response
if (error.response?.statusCode == 401) {
  try {
    // Display a toast message for unauthorized request
    // Fluttertoast.showToast(msg: "Unauthorized request. Please login again.");
    QuickAlert.show(context: AppKeys.globalNavigatorKey.currentState!.context, type: QuickAlertType.error, title: "Unauthorized request", text: "Please login again",
    confirmBtnColor: Colors.black,
    confirmBtnText: "Okay",
    barrierDismissible: false,
    animType: QuickAlertAnimType.slideInUp,
    onConfirmBtnTap: () {
      final localStorge = locator.get<KeyValueStorage>();
      localStorge..sharedPreferences.clear();
      AppKeys.globalNavigatorKey.currentState!.pop(  );
      AppKeys.globalNavigatorKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(builder: (c) => LoginScreen()), (route) => true,);
    },
    );
  } catch (e) {
    // Log error or handle toast failure gracefully
    log("Error displaying toast: $e");
  }
  // Return a specific exception for unauthorized requests
  return const NetworkExceptions.unauthorisedRequest();
}
  try {
    NetworkExceptions networkExceptions;

    switch (error.type) {
      case DioExceptionType.cancel:
        networkExceptions = const NetworkExceptions.requestCancelled();
        break;
      case DioExceptionType.connectionTimeout:
        networkExceptions = const NetworkExceptions.requestTimeout();
        break;
     
      case DioExceptionType.sendTimeout:
        networkExceptions = const NetworkExceptions.sendTimeout();
        break;
      case DioExceptionType.badResponse:
        networkExceptions = const NetworkExceptions.badRequest();
        break;
      case DioExceptionType.unknown:
        if (error.response?.statusCode == 401) {
          Fluttertoast.showToast(msg: "Unauthorised request");
          networkExceptions = const NetworkExceptions.unauthorisedRequest();
        } else {
          
          networkExceptions = NetworkExceptions.defaultError(error);
        }
        break;
      default:
        networkExceptions = NetworkExceptions.defaultError(error);
    }

    return networkExceptions;
  } on FormatException {
    return const NetworkExceptions.formatException();
  }
}
  // handling dio exceptions

// static NetworkExceptions getDioException(DioException error) {
//   try {
//     NetworkExceptions networkExceptions;
    
    
//     switch (error.type) {
//       case DioExceptionType.cancel:
//         networkExceptions = const NetworkExceptions.requestCancelled();
//         break;
//       case DioExceptionType.connectionTimeout:
//         networkExceptions = const NetworkExceptions.requestTimeout();
//         break;
//       case DioExceptionType.unknown:
//         networkExceptions = const NetworkExceptions.unableToProcess();
//         break;
//       case DioExceptionType.sendTimeout:
//         networkExceptions = const NetworkExceptions.sendTimeout();
//         break;
//       case DioExceptionType.badResponse:
//         networkExceptions = const NetworkExceptions.badRequest();
//         break;
//       default:
//         networkExceptions = NetworkExceptions.defaultError(error);
//     }
  
//     return networkExceptions;
//   } on FormatException {
//     return const NetworkExceptions.formatException();
//   } 
// }


static String getErrorMessage(NetworkExceptions networkExceptions) {
  return networkExceptions.when(
    defaultError: (dioException) {
  // Ensure the response and data are not null and properly typed
  if (dioException.response != null && dioException.response!.data is Map<String, dynamic>) {
    final data = dioException.response!.data as Map<String, dynamic>;
    // Safely access 'message' key if it exists
    if (data.containsKey('message')) {
      return data['message'];
    }
  }
  return ""; // Return an empty string if conditions are not met
},
notImplemented: () => "Not Implemented",
// defaultError: (dioException) => dioException.response != null && dioException.response?.data['message'] != null ? dioException.response?.data['message'] : "",    notImplemented: () => "Not Implemented",
    requestCancelled: () => "Request Cancelled",
    internalServerError: () => "Internal Server Error",
    notFound: (String reason) => reason.isNotEmpty ? reason : "Not Found",
    serviceUnavailable: () => "Service unavailable",
    
    methodNotAllowed: () => "Method not Allowed",
    badRequest: () => "Bad request",
    unauthorisedRequest: () => "Unauthorised request",
    unexpectedError: () => "Unexpected error occurred",
    requestTimeout: () => "Connection request timeout",
    noInternetConnection: () => "No internet connection",
    conflict: () => "Error due to a conflict",
    sendTimeout: () => "Send timeout in connection with API server",
    unableToProcess: () => "Unable to process the data",
    formatException: () => "Unexpected error occurred",
    notAcceptable: () => "Not acceptable",
  );
}

static String getErrorTitle(NetworkExceptions networkExceptions) {
  return networkExceptions.when(
    defaultError: (dioException) {
  // First, ensure the response and data are not null
  if (dioException.response != null && dioException.response!.data != null) {
    final data = dioException.response!.data;
    // Check if data is a Map and contains the 'error' key
    if (data is Map<String, dynamic> && data.containsKey('error')) {
      return data['error'].toString(); // Safely return the error, converting to String if necessary
    }
  }
  return "Bad request"; // Default error message if conditions are not met
},
// defaultError: (dioException) => dioException.response != null && dioException.response!.data != null && dioException.response?.data['error'] != null ? dioException.response?.data['error'] : "Bad request",  
    notImplemented: () => "Not Implemented",
    requestCancelled: () => "Request Cancelled",
    internalServerError: () => "Internal Server Error",
    notFound: (String reason) => reason.isNotEmpty ? reason : "Not Found",
    serviceUnavailable: () => "Service unavailable",
    
    methodNotAllowed: () => "Method not Allowed",
    badRequest: () => "Bad request",
    unauthorisedRequest: () => "Unauthorised request",
    unexpectedError: () => "Unexpected error occurred",
    requestTimeout: () => "Connection request timeout",
    noInternetConnection: () => "No internet connection",
    conflict: () => "Error due to a conflict",
    sendTimeout: () => "Send timeout in connection with API server",
    unableToProcess: () => "Unable to process the data",
    formatException: () => "Unexpected error occurred",
    notAcceptable: () => "Not acceptable",
  );
}


static int getStatusCode(NetworkExceptions networkExceptions) {
  return networkExceptions.when(
defaultError: (dioException) => dioException.response != null && dioException.response!.statusCode != null 
  ? int.tryParse(dioException.response!.statusCode.toString()) ?? 400 
  : 400,    notImplemented: () => 501,
    requestCancelled: () => 499,
    internalServerError: () => 500,
    notFound: (String reason) => 404,
    serviceUnavailable: () => 503,
    methodNotAllowed: () => 405,
    badRequest: () => 400,
    unauthorisedRequest: () => 401,
    unexpectedError: () => 600,
    requestTimeout: () => 408,
    noInternetConnection: () => 499,
    conflict: () => 409,
    sendTimeout: () => 408,
    unableToProcess: () => 422,
    formatException: () => 600,
    notAcceptable: () => 406,
  );
}

static NetworkExceptions getException(DioException exception) {
  

  switch (exception.type) {
        case DioExceptionType.cancel:
          return const NetworkExceptions.requestCancelled();
        case DioExceptionType.connectionTimeout:
          return const NetworkExceptions.requestTimeout();
        case DioExceptionType.unknown:
          return NetworkExceptions.defaultError(exception);
        case DioExceptionType.sendTimeout:
          return const NetworkExceptions.sendTimeout();
        case DioExceptionType.badResponse:
          return NetworkExceptions.defaultError(exception);
        default:
          return  NetworkExceptions.defaultError(exception);
      }
}

}

