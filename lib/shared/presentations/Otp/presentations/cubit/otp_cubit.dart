import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/presentations/Otp/presentations/cubit/state/otp_state.dart';
import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';


@injectable
class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpState.initial());


  final TextEditingController _otpController = TextEditingController();

  TextEditingController get otpcontroller  => _otpController;




  void onChangeOtp({required String? value}) {
    emit(state.copyWith(numberField: NumberField(value ?? "")));
  }


  void onSubmit({required BuildContext context,required VoidCallback successCallback}) {
    final otpVlaid = state.numberField.value.isRight();


    if(otpVlaid) {
      successCallback();
    }else{
      emit(state.copyWith(showInputError: true));
    }
  } 
}