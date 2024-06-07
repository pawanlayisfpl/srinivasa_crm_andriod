// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  EmailField get emailField => throw _privateConstructorUsedError;
  PasswordField get passwordField => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get showPassword => throw _privateConstructorUsedError;
  bool get isLoginValidated => throw _privateConstructorUsedError;
  bool get isLoginSuccess => throw _privateConstructorUsedError;
  bool get isLoginFailed => throw _privateConstructorUsedError;
  bool get showError => throw _privateConstructorUsedError;
  bool get isRememberMe => throw _privateConstructorUsedError;
  ApiFailedModel? get apiFailedModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {EmailField emailField,
      PasswordField passwordField,
      String? errorMessage,
      bool isLoading,
      bool showPassword,
      bool isLoginValidated,
      bool isLoginSuccess,
      bool isLoginFailed,
      bool showError,
      bool isRememberMe,
      ApiFailedModel? apiFailedModel});

  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailField = null,
    Object? passwordField = null,
    Object? errorMessage = freezed,
    Object? isLoading = null,
    Object? showPassword = null,
    Object? isLoginValidated = null,
    Object? isLoginSuccess = null,
    Object? isLoginFailed = null,
    Object? showError = null,
    Object? isRememberMe = null,
    Object? apiFailedModel = freezed,
  }) {
    return _then(_value.copyWith(
      emailField: null == emailField
          ? _value.emailField
          : emailField // ignore: cast_nullable_to_non_nullable
              as EmailField,
      passwordField: null == passwordField
          ? _value.passwordField
          : passwordField // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginValidated: null == isLoginValidated
          ? _value.isLoginValidated
          : isLoginValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginSuccess: null == isLoginSuccess
          ? _value.isLoginSuccess
          : isLoginSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginFailed: null == isLoginFailed
          ? _value.isLoginFailed
          : isLoginFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      showError: null == showError
          ? _value.showError
          : showError // ignore: cast_nullable_to_non_nullable
              as bool,
      isRememberMe: null == isRememberMe
          ? _value.isRememberMe
          : isRememberMe // ignore: cast_nullable_to_non_nullable
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
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmailField emailField,
      PasswordField passwordField,
      String? errorMessage,
      bool isLoading,
      bool showPassword,
      bool isLoginValidated,
      bool isLoginSuccess,
      bool isLoginFailed,
      bool showError,
      bool isRememberMe,
      ApiFailedModel? apiFailedModel});

  @override
  $ApiFailedModelCopyWith<$Res>? get apiFailedModel;
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailField = null,
    Object? passwordField = null,
    Object? errorMessage = freezed,
    Object? isLoading = null,
    Object? showPassword = null,
    Object? isLoginValidated = null,
    Object? isLoginSuccess = null,
    Object? isLoginFailed = null,
    Object? showError = null,
    Object? isRememberMe = null,
    Object? apiFailedModel = freezed,
  }) {
    return _then(_$LoginStateImpl(
      emailField: null == emailField
          ? _value.emailField
          : emailField // ignore: cast_nullable_to_non_nullable
              as EmailField,
      passwordField: null == passwordField
          ? _value.passwordField
          : passwordField // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginValidated: null == isLoginValidated
          ? _value.isLoginValidated
          : isLoginValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginSuccess: null == isLoginSuccess
          ? _value.isLoginSuccess
          : isLoginSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginFailed: null == isLoginFailed
          ? _value.isLoginFailed
          : isLoginFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      showError: null == showError
          ? _value.showError
          : showError // ignore: cast_nullable_to_non_nullable
              as bool,
      isRememberMe: null == isRememberMe
          ? _value.isRememberMe
          : isRememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailedModel: freezed == apiFailedModel
          ? _value.apiFailedModel
          : apiFailedModel // ignore: cast_nullable_to_non_nullable
              as ApiFailedModel?,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  const _$LoginStateImpl(
      {required this.emailField,
      required this.passwordField,
      this.errorMessage = null,
      this.isLoading = false,
      this.showPassword = false,
      this.isLoginValidated = false,
      this.isLoginSuccess = false,
      this.isLoginFailed = false,
      this.showError = false,
      this.isRememberMe = false,
      this.apiFailedModel = null});

  @override
  final EmailField emailField;
  @override
  final PasswordField passwordField;
  @override
  @JsonKey()
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool showPassword;
  @override
  @JsonKey()
  final bool isLoginValidated;
  @override
  @JsonKey()
  final bool isLoginSuccess;
  @override
  @JsonKey()
  final bool isLoginFailed;
  @override
  @JsonKey()
  final bool showError;
  @override
  @JsonKey()
  final bool isRememberMe;
  @override
  @JsonKey()
  final ApiFailedModel? apiFailedModel;

  @override
  String toString() {
    return 'LoginState(emailField: $emailField, passwordField: $passwordField, errorMessage: $errorMessage, isLoading: $isLoading, showPassword: $showPassword, isLoginValidated: $isLoginValidated, isLoginSuccess: $isLoginSuccess, isLoginFailed: $isLoginFailed, showError: $showError, isRememberMe: $isRememberMe, apiFailedModel: $apiFailedModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.emailField, emailField) ||
                other.emailField == emailField) &&
            (identical(other.passwordField, passwordField) ||
                other.passwordField == passwordField) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword) &&
            (identical(other.isLoginValidated, isLoginValidated) ||
                other.isLoginValidated == isLoginValidated) &&
            (identical(other.isLoginSuccess, isLoginSuccess) ||
                other.isLoginSuccess == isLoginSuccess) &&
            (identical(other.isLoginFailed, isLoginFailed) ||
                other.isLoginFailed == isLoginFailed) &&
            (identical(other.showError, showError) ||
                other.showError == showError) &&
            (identical(other.isRememberMe, isRememberMe) ||
                other.isRememberMe == isRememberMe) &&
            (identical(other.apiFailedModel, apiFailedModel) ||
                other.apiFailedModel == apiFailedModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      emailField,
      passwordField,
      errorMessage,
      isLoading,
      showPassword,
      isLoginValidated,
      isLoginSuccess,
      isLoginFailed,
      showError,
      isRememberMe,
      apiFailedModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {required final EmailField emailField,
      required final PasswordField passwordField,
      final String? errorMessage,
      final bool isLoading,
      final bool showPassword,
      final bool isLoginValidated,
      final bool isLoginSuccess,
      final bool isLoginFailed,
      final bool showError,
      final bool isRememberMe,
      final ApiFailedModel? apiFailedModel}) = _$LoginStateImpl;

  @override
  EmailField get emailField;
  @override
  PasswordField get passwordField;
  @override
  String? get errorMessage;
  @override
  bool get isLoading;
  @override
  bool get showPassword;
  @override
  bool get isLoginValidated;
  @override
  bool get isLoginSuccess;
  @override
  bool get isLoginFailed;
  @override
  bool get showError;
  @override
  bool get isRememberMe;
  @override
  ApiFailedModel? get apiFailedModel;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
