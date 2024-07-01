import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

  // handling dio exceptions for showing default error messages
  // static NetworkExceptions getDioException(error) {
  //   if (error is Exception) {
  //     try {
  //       NetworkExceptions networkExceptions;
  //       if (error is DioException) {
  //         switch (error.type) {
  //           case DioExceptionType.cancel:
  //             networkExceptions = const NetworkExceptions.requestCancelled();
  //             break;
  //           case DioExceptionType.connectionTimeout:
  //             networkExceptions = const NetworkExceptions.requestTimeout();
  //             break;
  //           case DioExceptionType.unknown:
  //             networkExceptions = const NetworkExceptions.noInternetConnection();
  //             break;
  //           case DioExceptionType.sendTimeout:
  //             networkExceptions = const NetworkExceptions.sendTimeout();
  //             break;
  //           case DioExceptionType.badResponse:
  //             if (error.response != null) {
  //               switch (error.response!.statusCode) {
  //                 case 400:
  //                 case 401:
  //                 case 403:
  //                   networkExceptions = const NetworkExceptions.unauthorisedRequest();
  //                   break;
  //                 case 404:
  //                   networkExceptions = const NetworkExceptions.notFound("Not found");
  //                   break;
  //                 case 409:
  //                   networkExceptions = const NetworkExceptions.conflict();
  //                   break;
  //                 case 408:
  //                   networkExceptions = const NetworkExceptions.requestTimeout();
  //                   break;
  //                 case 500:
  //                   networkExceptions = const NetworkExceptions.internalServerError();
  //                   break;
  //                 case 503:
  //                   networkExceptions = const NetworkExceptions.serviceUnavailable();
  //                   break;
  //                 default:
  //                   var responseCode = error.response!.statusCode;
  //                   networkExceptions = NetworkExceptions.defaultError(
  //                     "Received invalid status code: $responseCode",
  //                   );
  //               }
  //             } else {
  //               networkExceptions = const NetworkExceptions.defaultError(
  //                 "No response received",
  //               );
  //             }
  //             break;
  //           case DioExceptionType.receiveTimeout:
  //             networkExceptions = const NetworkExceptions.requestTimeout();
  //             break;
  //           case DioExceptionType.badCertificate:
  //             networkExceptions = const NetworkExceptions.unableToProcess();
  //             break;
  //           case DioExceptionType.connectionError:
  //             networkExceptions = const NetworkExceptions.noInternetConnection();
  //             break;
  //         }
  //       } else if (error is SocketException) {
  //         networkExceptions = const NetworkExceptions.noInternetConnection();
  //       } else {
  //         networkExceptions = const NetworkExceptions.unexpectedError();
  //       }
  //       return networkExceptions;
  //     } on FormatException {
  //       // Helper.printError(e.toString());
  //       return const NetworkExceptions.formatException();
  //     } catch (_) {
  //       return const NetworkExceptions.unexpectedError();
  //     }
  //   } else {
  //     if (error.toString().contains("is not a subtype of")) {
  //       return const NetworkExceptions.unableToProcess();
  //     } else {
  //       return const NetworkExceptions.unexpectedError();
  //     }
  //   }
  // }
  // handling dio exceptions

static NetworkExceptions getDioException(DioException error) {
  try {
    NetworkExceptions networkExceptions;
    
    
    switch (error.type) {
      case DioExceptionType.cancel:
        networkExceptions = const NetworkExceptions.requestCancelled();
        break;
      case DioExceptionType.connectionTimeout:
        networkExceptions = const NetworkExceptions.requestTimeout();
        break;
      case DioExceptionType.unknown:
        networkExceptions = const NetworkExceptions.unableToProcess();
        break;
      case DioExceptionType.sendTimeout:
        networkExceptions = const NetworkExceptions.sendTimeout();
        break;
      case DioExceptionType.badResponse:
        networkExceptions = const NetworkExceptions.badRequest();
        break;
      default:
        networkExceptions = NetworkExceptions.defaultError(error);
    }
  
    return networkExceptions;
  } on FormatException {
    return const NetworkExceptions.formatException();
  } 
}


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

