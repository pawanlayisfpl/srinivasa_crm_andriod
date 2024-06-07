// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_failed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiFailedModel _$ApiFailedModelFromJson(Map<String, dynamic> json) {
  return _ApiFailedModel.fromJson(json);
}

/// @nodoc
mixin _$ApiFailedModel {
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiFailedModelCopyWith<ApiFailedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiFailedModelCopyWith<$Res> {
  factory $ApiFailedModelCopyWith(
          ApiFailedModel value, $Res Function(ApiFailedModel) then) =
      _$ApiFailedModelCopyWithImpl<$Res, ApiFailedModel>;
  @useResult
  $Res call({int statusCode, String message});
}

/// @nodoc
class _$ApiFailedModelCopyWithImpl<$Res, $Val extends ApiFailedModel>
    implements $ApiFailedModelCopyWith<$Res> {
  _$ApiFailedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiFailedModelImplCopyWith<$Res>
    implements $ApiFailedModelCopyWith<$Res> {
  factory _$$ApiFailedModelImplCopyWith(_$ApiFailedModelImpl value,
          $Res Function(_$ApiFailedModelImpl) then) =
      __$$ApiFailedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int statusCode, String message});
}

/// @nodoc
class __$$ApiFailedModelImplCopyWithImpl<$Res>
    extends _$ApiFailedModelCopyWithImpl<$Res, _$ApiFailedModelImpl>
    implements _$$ApiFailedModelImplCopyWith<$Res> {
  __$$ApiFailedModelImplCopyWithImpl(
      _$ApiFailedModelImpl _value, $Res Function(_$ApiFailedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
  }) {
    return _then(_$ApiFailedModelImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiFailedModelImpl implements _ApiFailedModel {
  const _$ApiFailedModelImpl({required this.statusCode, required this.message});

  factory _$ApiFailedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiFailedModelImplFromJson(json);

  @override
  final int statusCode;
  @override
  final String message;

  @override
  String toString() {
    return 'ApiFailedModel(statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiFailedModelImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiFailedModelImplCopyWith<_$ApiFailedModelImpl> get copyWith =>
      __$$ApiFailedModelImplCopyWithImpl<_$ApiFailedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiFailedModelImplToJson(
      this,
    );
  }
}

abstract class _ApiFailedModel implements ApiFailedModel {
  const factory _ApiFailedModel(
      {required final int statusCode,
      required final String message}) = _$ApiFailedModelImpl;

  factory _ApiFailedModel.fromJson(Map<String, dynamic> json) =
      _$ApiFailedModelImpl.fromJson;

  @override
  int get statusCode;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ApiFailedModelImplCopyWith<_$ApiFailedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
