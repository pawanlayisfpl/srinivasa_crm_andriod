

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/login/domain/models/email_field.dart';

part 'forget_password_state.freezed.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {

  const factory ForgetPasswordState({
    required EmailField emailField,
    required bool isSubmitting,
    @Default(false) bool showValidationError,
    @Default(null) ApiFailedModel? apiFailedModel,

  }) = _ForgetPasswordState;

  factory ForgetPasswordState.initial() => ForgetPasswordState(emailField: EmailField(""), isSubmitting: false,apiFailedModel: null,showValidationError: false);

}