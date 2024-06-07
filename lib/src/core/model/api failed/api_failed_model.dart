import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failed_model.freezed.dart';
part 'api_failed_model.g.dart';

@freezed
abstract class ApiFailedModel with _$ApiFailedModel {
  const factory ApiFailedModel({
    required int statusCode,
    required String message,
  }) = _ApiFailedModel;

  factory ApiFailedModel.fromJson(Map<String, dynamic> json) => _$ApiFailedModelFromJson(json);
}