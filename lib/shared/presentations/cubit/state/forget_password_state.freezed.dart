// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgetPasswordState {
  EmailField get emailField => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showValidationError => throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgetPasswordStateCopyWith<ForgetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordStateCopyWith<$Res> {
  factory $ForgetPasswordStateCopyWith(
          ForgetPasswordState value, $Res Function(ForgetPasswordState) then) =
      _$ForgetPasswordStateCopyWithImpl<$Res, ForgetPasswordState>;
  @useResult
  $Res call(
      {EmailField emailField,
      bool isSubmitting,
      bool showValidationError,
      ApiFailedModel? apiFailedModel});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class _$ForgetPasswordStateCopyWithImpl<$Res, $Val extends ForgetPasswordState>
    implements $ForgetPasswordStateCopyWith<$Res> {
  _$ForgetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailField = null,
    Object? isSubmitting = null,
    Object? showValidationError = null,
    Object? apiFailedModel = freezed,
  }) {
    return _then(_value.copyWith(
      emailField: null == emailField
          ? _value.emailField
          : emailField // ignore: cast_nullable_to_non_nullable
              as EmailField,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showValidationError: null == showValidationError
          ? _value.showValidationError
          : showValidationError // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ForgetPasswordStateImplCopyWith<$Res>
    implements $ForgetPasswordStateCopyWith<$Res> {
  factory _$$ForgetPasswordStateImplCopyWith(_$ForgetPasswordStateImpl value,
          $Res Function(_$ForgetPasswordStateImpl) then) =
      __$$ForgetPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmailField emailField,
      bool isSubmitting,
      bool showValidationError,
      ApiFailedModel? apiFailedModel});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class __$$ForgetPasswordStateImplCopyWithImpl<$Res>
    extends _$ForgetPasswordStateCopyWithImpl<$Res, _$ForgetPasswordStateImpl>
    implements _$$ForgetPasswordStateImplCopyWith<$Res> {
  __$$ForgetPasswordStateImplCopyWithImpl(_$ForgetPasswordStateImpl _value,
      $Res Function(_$ForgetPasswordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailField = null,
    Object? isSubmitting = null,
    Object? showValidationError = null,
    Object? apiFailedModel = freezed,
  }) {
    return _then(_$ForgetPasswordStateImpl(
      emailField: null == emailField
          ? _value.emailField
          : emailField // ignore: cast_nullable_to_non_nullable
              as EmailField,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showValidationError: null == showValidationError
          ? _value.showValidationError
          : showValidationError // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
    ));
  }
}

/// @nodoc

class _$ForgetPasswordStateImpl implements _ForgetPasswordState {
  const _$ForgetPasswordStateImpl(
      {required this.emailField,
      required this.isSubmitting,
      this.showValidationError = false,
      this.apiFailedModel = null});

  @override
  final EmailField emailField;
  @override
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool showValidationError;
  @override
  @JsonKey()
  final ApiFailedModel? apiFailedModel;

  @override
  String toString() {
    return 'ForgetPasswordState(emailField: $emailField, isSubmitting: $isSubmitting, showValidationError: $showValidationError, apiFailedModel: $apiFailedModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgetPasswordStateImpl &&
            (identical(other.emailField, emailField) ||
                other.emailField == emailField) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.showValidationError, showValidationError) ||
                other.showValidationError == showValidationError) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailField, isSubmitting,
      showValidationError, apiFailedModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgetPasswordStateImplCopyWith<_$ForgetPasswordStateImpl> get copyWith =>
      __$$ForgetPasswordStateImplCopyWithImpl<_$ForgetPasswordStateImpl>(
          this, _$identity);
}

abstract class _ForgetPasswordState implements ForgetPasswordState {
  const factory _ForgetPasswordState(
      {required final EmailField emailField,
      required final bool isSubmitting,
      final bool showValidationError,
      final ApiFailedModel? apiFailedModel}) = _$ForgetPasswordStateImpl;

  @override
  EmailField get emailField;
  @override
  bool get isSubmitting;
  @override
  bool get showValidationError;
  @override
  ApiFailedModel? get apiFailedModel;
  @override
  @JsonKey(ignore: true)
  _$$ForgetPasswordStateImplCopyWith<_$ForgetPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
