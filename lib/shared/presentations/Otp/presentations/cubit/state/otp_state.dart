

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/common/fields/string_field.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

part 'otp_state.freezed.dart';

@freezed
class OtpState with _$OtpState {

  const factory OtpState({
    required NumberField numberField,
    required StringField passwordField,
    required bool isSubmitting,
    @Default(false) bool showInputError,
    @Default(null) ApiFailedModel? apiFailedModel,

  }) = _OtpState;

  factory OtpState.initial() => OtpState(numberField: NumberField(""),passwordField: StringField(''), isSubmitting: false,apiFailedModel: null,showInputError: false);

}