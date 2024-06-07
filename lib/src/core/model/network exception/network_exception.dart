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

  const factory NetworkExceptions.defaultError(String error,int statusCode) = DefaultError;

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

static NetworkExceptions getDioException(error) {
  if (error is Exception) {
    try {
      NetworkExceptions networkExceptions;
      if (error is SocketException) {
        networkExceptions = const NetworkExceptions.noInternetConnection();
      } else if (error is DioException) {
        String errorMessage = error.response != null ? error.response!.data['message'] : 'No response received';
        int errorCode = error.response?.statusCode ?? 400;
        switch (error.type) {
          case DioExceptionType.cancel:
            networkExceptions = NetworkExceptions.defaultError(errorMessage, errorCode);
            break;
          case DioExceptionType.connectionTimeout:
            networkExceptions = const NetworkExceptions.requestTimeout();
            break;
          case DioExceptionType.unknown:
            networkExceptions = NetworkExceptions.defaultError(errorMessage, errorCode);
            break;
          case DioExceptionType.sendTimeout:
            networkExceptions = const NetworkExceptions.sendTimeout();
            break;
          case DioExceptionType.badResponse:
            networkExceptions = NetworkExceptions.defaultError(errorMessage, errorCode);
            break;
          default:
            networkExceptions = NetworkExceptions.defaultError(errorMessage, errorCode);
        }
      } else {
        networkExceptions = const NetworkExceptions.defaultError('Unexpected error occurred', 400);
      }
      return networkExceptions;
    } on FormatException {
      return const NetworkExceptions.formatException();
    } catch (_) {
      return const NetworkExceptions.unexpectedError();
    }
  } else {
    if (error.toString().contains("is not a subtype of")) {
      return const NetworkExceptions.unableToProcess();
    } else {
      return const NetworkExceptions.unexpectedError();
    }
  }
}


static String getErrorMessage(NetworkExceptions networkExceptions) {
  return networkExceptions.when(
    notImplemented: () => "Not Implemented",
    requestCancelled: () => "Request Cancelled",
    internalServerError: () => "Internal Server Error",
    notFound: (String reason) => reason.isNotEmpty ? reason : "Not Found",
    serviceUnavailable: () => "Service unavailable",
    methodNotAllowed: () => "Method Allowed",
    badRequest: () => "Bad request",
    unauthorisedRequest: () => "Unauthorised request",
    unexpectedError: () => "Unexpected error occurred",
    requestTimeout: () => "Connection request timeout",
    noInternetConnection: () => "No internet connection",
    conflict: () => "Error due to a conflict",
    sendTimeout: () => "Send timeout in connection with API server",
    unableToProcess: () => "Unable to process the data",
    defaultError: (String error,int statusCode) => error.isNotEmpty ? error : "Unexpected error occurred",
    formatException: () => "Unexpected error occurred",
    notAcceptable: () => "Not acceptable",
  );
}

static int getStatusCode(NetworkExceptions networkExceptions) {
  return networkExceptions.when(
    notImplemented: () => 501,
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
    defaultError: (String error, int statusCode) => statusCode, // This will now return the status code from the API
    formatException: () => 600,
    notAcceptable: () => 406,
  );
}

static NetworkExceptions getException(error) {
  if (error is SocketException) {
    return const NetworkExceptions.noInternetConnection();
  } else if (error is DioException) {
    try {
      String errorMessage = error.response != null ? error.response!.data['message'] : 'Please try again later';
      int errorCode = error.response?.statusCode ?? 400;
      switch (error.type) {
        case DioExceptionType.cancel:
          return NetworkExceptions.defaultError(errorMessage, errorCode);
        case DioExceptionType.connectionTimeout:
          return const NetworkExceptions.requestTimeout();
        case DioExceptionType.unknown:
          return NetworkExceptions.defaultError(errorMessage, errorCode);
        case DioExceptionType.sendTimeout:
          return const NetworkExceptions.sendTimeout();
        case DioExceptionType.badResponse:
          return NetworkExceptions.defaultError(errorMessage, errorCode);
        default:
          return const NetworkExceptions.unexpectedError();
      }
    } on FormatException {
      return const NetworkExceptions.formatException();
    } catch (_) {
      return const NetworkExceptions.unexpectedError();
    }
  } else {
    if (error.toString().contains("is not a subtype of")) {
      return const NetworkExceptions.unableToProcess();
    } else {
      return const NetworkExceptions.unexpectedError();
    }
  }
}

}

