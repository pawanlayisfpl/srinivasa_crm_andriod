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
  StringField get passwordField => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showInputError => throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;

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
      StringField passwordField,
      bool isSubmitting,
      bool showInputError,
      ApiFailedModel? apiFailedModel});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
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
    Object? passwordField = null,
    Object? isSubmitting = null,
    Object? showInputError = null,
    Object? apiFailedModel = freezed,
  }) {
    return _then(_value.copyWith(
      numberField: null == numberField
          ? _value.numberField
          : numberField // ignore: cast_nullable_to_non_nullable
              as NumberField,
      passwordField: null == passwordField
          ? _value.passwordField
          : passwordField // ignore: cast_nullable_to_non_nullable
              as StringField,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showInputError: null == showInputError
          ? _value.showInputError
          : showInputError // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel {
    if (_value.apiFailedModel == null) {
      return null;
    }

    return $ApiFailedModelCopyWith<$Res>(_value.apiFailedModel!, (value) {
      return _then(_value.copyWith(apiFailedModel: value) as $Val);
    });
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
      StringField passwordField,
      bool isSubmitting,
      bool showInputError,
      ApiFailedModel? apiFailedModel});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
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
    Object? passwordField = null,
    Object? isSubmitting = null,
    Object? showInputError = null,
    Object? apiFailedModel = freezed,
  }) {
    return _then(_$OtpStateImpl(
      numberField: null == numberField
          ? _value.numberField
          : numberField // ignore: cast_nullable_to_non_nullable
              as NumberField,
      passwordField: null == passwordField
          ? _value.passwordField
          : passwordField // ignore: cast_nullable_to_non_nullable
              as StringField,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showInputError: null == showInputError
          ? _value.showInputError
          : showInputError // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
    ));
  }
}

/// @nodoc

class _$OtpStateImpl implements _OtpState {
  const _$OtpStateImpl(
      {required this.numberField,
      required this.passwordField,
      required this.isSubmitting,
      this.showInputError = false,
      this.apiFailedModel = null});

  @override
  final NumberField numberField;
  @override
  final StringField passwordField;
  @override
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool showInputError;
  @override
  @JsonKey()
  final ApiFailedModel? apiFailedModel;

  @override
  String toString() {
    return 'OtpState(numberField: $numberField, passwordField: $passwordField, isSubmitting: $isSubmitting, showInputError: $showInputError, apiFailedModel: $apiFailedModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpStateImpl &&
            (identical(other.numberField, numberField) ||
                other.numberField == numberField) &&
            (identical(other.passwordField, passwordField) ||
                other.passwordField == passwordField) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.showInputError, showInputError) ||
                other.showInputError == showInputError) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, numberField, passwordField,
      isSubmitting, showInputError, apiFailedModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpStateImplCopyWith<_$OtpStateImpl> get copyWith =>
      __$$OtpStateImplCopyWithImpl<_$OtpStateImpl>(this, _$identity);
}

abstract class _OtpState implements OtpState {
  const factory _OtpState(
      {required final NumberField numberField,
      required final StringField passwordField,
      required final bool isSubmitting,
      final bool showInputError,
      final ApiFailedModel? apiFailedModel}) = _$OtpStateImpl;

  @override
  NumberField get numberField;
  @override
  StringField get passwordField;
  @override
  bool get isSubmitting;
  @override
  bool get showInputError;
  @override
  ApiFailedModel? get apiFailedModel;
  @override
  @JsonKey(ignore: true)
  _$$OtpStateImplCopyWith<_$OtpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
