


import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/model/model.dart';
import '../../domain/models/email_field.dart';
import '../../domain/models/password_field.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required EmailField emailField,
    required PasswordField passwordField,
    @Default(null) String? errorMessage,
    @Default(false) bool isLoading,
    @Default(false) bool showPassword,
    @Default(false) bool isLoginValidated,
    @Default(false) bool isLoginSuccess,
    @Default(false) bool isLoginFailed,
    @Default(false) bool showError,
    @Default(false) bool isRememberMe,
    @Default(null) ApiFailedModel? apiFailedModel
    
  }) = _LoginState;


  factory LoginState.initial() => LoginState(emailField: EmailField(''), passwordField: PasswordField(''),
  isLoading: false,
  showPassword: false,
  isLoginValidated: false,
  isLoginSuccess: false,
  isLoginFailed: false,
  showError: false,
  errorMessage: null,
  isRememberMe: false,
  apiFailedModel: null,
  
  
  
  );
  
  
}