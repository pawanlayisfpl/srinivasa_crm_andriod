import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/features/login/domain/models/email_field.dart';

import 'state/forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordState.initial());


  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController  => _emailController;




  void onChangeEmail({required String? value}) {
    emit(state.copyWith(emailField: EmailField(value ?? "")));
  }


  void onSubmit({required BuildContext context,required VoidCallback successCallback}) {
    final email = state.emailField.value.isRight();


    if(email) {
      successCallback();
    }else{
      emit(state.copyWith(showValidationError: true));
    }
  } 

  void resetState() {
    _emailController.clear();
        emit(ForgetPasswordState.initial());

  }

  @override
  Future<void> close() {
    // TODO: implement close
    _emailController.dispose();
    return super.close();
  }
}