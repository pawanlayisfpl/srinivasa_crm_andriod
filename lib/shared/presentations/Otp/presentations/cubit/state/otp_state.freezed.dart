// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OtpState {
  NumberField get numberField => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showInputError => throw _privateConstructorUsedError;
  ApiResponseModel? get apiResponseModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpStateCopyWith<OtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpStateCopyWith<$Res> {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) then) =
      _$OtpStateCopyWithImpl<$Res, OtpState>;
  @useResult
  $Res call(
      {NumberField numberField,
      bool isSubmitting,
      bool showInputError,
      ApiResponseModel? apiResponseModel});
}

/// @nodoc
class _$OtpStateCopyWithImpl<$Res, $Val extends OtpState>
    implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberField = null,
    Object? isSubmitting = null,
    Object? showInputError = null,
    Object? apiResponseModel = freezed,
  }) {
    return _then(_value.copyWith(
      numberField: null == numberField
          ? _value.numberField
          : numberField // ignore: cast_nullable_to_non_nullable
              as NumberField,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showInputError: null == showInputError
          ? _value.showInputError
          : showInputError // ignore: cast_nullable_to_non_nullable
              as bool,
      apiResponseModel: freezed == apiResponseModel
          ? _value.apiResponseModel
          : apiResponseModel // ignore: cast_nullable_to_non_nullable
              as ApiResponseModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpStateImplCopyWith<$Res>
    implements $OtpStateCopyWith<$Res> {
  factory _$$OtpStateImplCopyWith(
          _$OtpStateImpl value, $Res Function(_$OtpStateImpl) then) =
      __$$OtpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NumberField numberField,
      bool isSubmitting,
      bool showInputError,
      ApiResponseModel? apiResponseModel});
}

/// @nodoc
class __$$OtpStateImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$OtpStateImpl>
    implements _$$OtpStateImplCopyWith<$Res> {
  __$$OtpStateImplCopyWithImpl(
      _$OtpStateImpl _value, $Res Function(_$OtpStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberField = null,
    Object? isSubmitting = null,
    Object? showInputError = null,
    Object? apiResponseModel = freezed,
  }) {
    return _then(_$OtpStateImpl(
      numberField: null == numberField
          ? _value.numberField
          : numberField // ignore: cast_nullable_to_non_nullable
              as NumberField,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showInputError: null == showInputError
          ? _value.showInputError
          : showInputError // ignore: cast_nullable_to_non_nullable
              as bool,
      apiResponseModel: freezed == apiResponseModel
          ? _value.apiResponseModel
          : apiResponseModel // ignore: cast_nullable_to_non_nullable
              as ApiResponseModel?,
    ));
  }
}

/// @nodoc

class _$OtpStateImpl implements _OtpState {
  const _$OtpStateImpl(
      {required this.numberField,
      required this.isSubmitting,
      this.showInputError = false,
      this.apiResponseModel = null});

  @override
  final NumberField numberField;
  @override
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool showInputError;
  @override
  @JsonKey()
  final ApiResponseModel? apiResponseModel;

  @override
  String toString() {
    return 'OtpState(numberField: $numberField, isSubmitting: $isSubmitting, showInputError: $showInputError, apiResponseModel: $apiResponseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpStateImpl &&
            (identical(other.numberField, numberField) ||
                other.numberField == numberField) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.showInputError, showInputError) ||
                other.showInputError == showInputError) &&
            (identical(other.apiResponseModel, apiResponseModel) ||
                other.apiResponseModel == apiResponseModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, numberField, isSubmitting, showInputError, apiResponseModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpStateImplCopyWith<_$OtpStateImpl> get copyWith =>
      __$$OtpStateImplCopyWithImpl<_$OtpStateImpl>(this, _$identity);
}

abstract class _OtpState implements OtpState {
  const factory _OtpState(
      {required final NumberField numberField,
      required final bool isSubmitting,
      final bool showInputError,
      final ApiResponseModel? apiResponseModel}) = _$OtpStateImpl;

  @override
  NumberField get numberField;
  @override
  bool get isSubmitting;
  @override
  bool get showInputError;
  @override
  ApiResponseModel? get apiResponseModel;
  @override
  @JsonKey(ignore: true)
  _$$OtpStateImplCopyWith<_$OtpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
