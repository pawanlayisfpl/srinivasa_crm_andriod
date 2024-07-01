import 'package:freezed_annotation/freezed_annotation.dart';

import '../model.dart';

part 'api_failed_model.freezed.dart';
part 'api_failed_model.g.dart';

@freezed
abstract class ApiFailedModel with _$ApiFailedModel {
  const factory ApiFailedModel({
    required int statusCode,
    required String message,
    required String errorMessage,
  }) = _ApiFailedModel;

  factory ApiFailedModel.fromJson(Map<String, dynamic> json) => _$ApiFailedModelFromJson(json);
   static ApiFailedModel fromNetworkExceptions(dynamic l) {
    return ApiFailedModel(
      statusCode: NetworkExceptions.getStatusCode(l),
      message: NetworkExceptions.getErrorMessage(l),
      errorMessage: NetworkExceptions.getErrorTitle(l),
    );
  }
}