// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_failed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiFailedModelImpl _$$ApiFailedModelImplFromJson(Map<String, dynamic> json) =>
    _$ApiFailedModelImpl(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      errorMessage: json['errorMessage'] as String,
    );

Map<String, dynamic> _$$ApiFailedModelImplToJson(
        _$ApiFailedModelImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'errorMessage': instance.errorMessage,
    };
