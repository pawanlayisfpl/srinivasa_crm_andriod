

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/login/domain/models/password_field.dart';

part 'update_password_state.freezed.dart';

@freezed
class UpdatePasswordState with _$UpdatePasswordState {

  const factory UpdatePasswordState({
    required PasswordField passwordField,
    required PasswordField confirmField,
    required bool isSubmitting,
    @Default(false) bool showInputError,
    @Default(null) ApiResponseModel? apiResponseModel,
    @Default(false) bool showPassword,
    @Default(false) bool showConfirmPassword

  }) = _UpdatePasswordState;

  factory UpdatePasswordState.initial() => UpdatePasswordState(passwordField: PasswordField(""),confirmField: PasswordField(""), isSubmitting: false,apiResponseModel: null,showInputError: false,showPassword: true,showConfirmPassword: true);

}