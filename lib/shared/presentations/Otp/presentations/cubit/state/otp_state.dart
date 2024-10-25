

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

part 'otp_state.freezed.dart';

@freezed
class OtpState with _$OtpState {

  const factory OtpState({
    required NumberField numberField,
    required bool isSubmitting,
    @Default(false) bool showInputError,
    @Default(null) ApiResponseModel? apiResponseModel,

  }) = _OtpState;

  factory OtpState.initial() => OtpState(numberField: NumberField(""), isSubmitting: false,apiResponseModel: null,showInputError: false);

}