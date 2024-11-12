// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdatePasswordState {
  PasswordField get passwordField => throw _privateConstructorUsedError;
  PasswordField get confirmField => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showInputError => throw _privateConstructorUsedError;
  ApiResponseModel? get apiResponseModel => throw _privateConstructorUsedError;
  bool get showPassword => throw _privateConstructorUsedError;
  bool get showConfirmPassword => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePasswordStateCopyWith<UpdatePasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePasswordStateCopyWith<$Res> {
  factory $UpdatePasswordStateCopyWith(
          UpdatePasswordState value, $Res Function(UpdatePasswordState) then) =
      _$UpdatePasswordStateCopyWithImpl<$Res, UpdatePasswordState>;
  @useResult
  $Res call(
      {PasswordField passwordField,
      PasswordField confirmField,
      bool isSubmitting,
      bool showInputError,
      ApiResponseModel? apiResponseModel,
      bool showPassword,
      bool showConfirmPassword});
}

/// @nodoc
class _$UpdatePasswordStateCopyWithImpl<$Res, $Val extends UpdatePasswordState>
    implements $UpdatePasswordStateCopyWith<$Res> {
  _$UpdatePasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwordField = null,
    Object? confirmField = null,
    Object? isSubmitting = null,
    Object? showInputError = null,
    Object? apiResponseModel = freezed,
    Object? showPassword = null,
    Object? showConfirmPassword = null,
  }) {
    return _then(_value.copyWith(
      passwordField: null == passwordField
          ? _value.passwordField
          : passwordField // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      confirmField: null == confirmField
          ? _value.confirmField
          : confirmField // ignore: cast_nullable_to_non_nullable
              as PasswordField,
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
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfirmPassword: null == showConfirmPassword
          ? _value.showConfirmPassword
          : showConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePasswordStateImplCopyWith<$Res>
    implements $UpdatePasswordStateCopyWith<$Res> {
  factory _$$UpdatePasswordStateImplCopyWith(_$UpdatePasswordStateImpl value,
          $Res Function(_$UpdatePasswordStateImpl) then) =
      __$$UpdatePasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PasswordField passwordField,
      PasswordField confirmField,
      bool isSubmitting,
      bool showInputError,
      ApiResponseModel? apiResponseModel,
      bool showPassword,
      bool showConfirmPassword});
}

/// @nodoc
class __$$UpdatePasswordStateImplCopyWithImpl<$Res>
    extends _$UpdatePasswordStateCopyWithImpl<$Res, _$UpdatePasswordStateImpl>
    implements _$$UpdatePasswordStateImplCopyWith<$Res> {
  __$$UpdatePasswordStateImplCopyWithImpl(_$UpdatePasswordStateImpl _value,
      $Res Function(_$UpdatePasswordStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdatePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwordField = null,
    Object? confirmField = null,
    Object? isSubmitting = null,
    Object? showInputError = null,
    Object? apiResponseModel = freezed,
    Object? showPassword = null,
    Object? showConfirmPassword = null,
  }) {
    return _then(_$UpdatePasswordStateImpl(
      passwordField: null == passwordField
          ? _value.passwordField
          : passwordField // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      confirmField: null == confirmField
          ? _value.confirmField
          : confirmField // ignore: cast_nullable_to_non_nullable
              as PasswordField,
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
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfirmPassword: null == showConfirmPassword
          ? _value.showConfirmPassword
          : showConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdatePasswordStateImpl implements _UpdatePasswordState {
  const _$UpdatePasswordStateImpl(
      {required this.passwordField,
      required this.confirmField,
      required this.isSubmitting,
      this.showInputError = false,
      this.apiResponseModel = null,
      this.showPassword = false,
      this.showConfirmPassword = false});

  @override
  final PasswordField passwordField;
  @override
  final PasswordField confirmField;
  @override
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool showInputError;
  @override
  @JsonKey()
  final ApiResponseModel? apiResponseModel;
  @override
  @JsonKey()
  final bool showPassword;
  @override
  @JsonKey()
  final bool showConfirmPassword;

  @override
  String toString() {
    return 'UpdatePasswordState(passwordField: $passwordField, confirmField: $confirmField, isSubmitting: $isSubmitting, showInputError: $showInputError, apiResponseModel: $apiResponseModel, showPassword: $showPassword, showConfirmPassword: $showConfirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordStateImpl &&
            (identical(other.passwordField, passwordField) ||
                other.passwordField == passwordField) &&
            (identical(other.confirmField, confirmField) ||
                other.confirmField == confirmField) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.showInputError, showInputError) ||
                other.showInputError == showInputError) &&
            (identical(other.apiResponseModel, apiResponseModel) ||
                other.apiResponseModel == apiResponseModel) &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword) &&
            (identical(other.showConfirmPassword, showConfirmPassword) ||
                other.showConfirmPassword == showConfirmPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      passwordField,
      confirmField,
      isSubmitting,
      showInputError,
      apiResponseModel,
      showPassword,
      showConfirmPassword);

  /// Create a copy of UpdatePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordStateImplCopyWith<_$UpdatePasswordStateImpl> get copyWith =>
      __$$UpdatePasswordStateImplCopyWithImpl<_$UpdatePasswordStateImpl>(
          this, _$identity);
}

abstract class _UpdatePasswordState implements UpdatePasswordState {
  const factory _UpdatePasswordState(
      {required final PasswordField passwordField,
      required final PasswordField confirmField,
      required final bool isSubmitting,
      final bool showInputError,
      final ApiResponseModel? apiResponseModel,
      final bool showPassword,
      final bool showConfirmPassword}) = _$UpdatePasswordStateImpl;

  @override
  PasswordField get passwordField;
  @override
  PasswordField get confirmField;
  @override
  bool get isSubmitting;
  @override
  bool get showInputError;
  @override
  ApiResponseModel? get apiResponseModel;
  @override
  bool get showPassword;
  @override
  bool get showConfirmPassword;

  /// Create a copy of UpdatePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePasswordStateImplCopyWith<_$UpdatePasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
