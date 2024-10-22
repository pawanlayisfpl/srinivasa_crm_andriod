import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/presentations/Update%20Password/presentations/cubit/state/update_password_state.dart';
import 'package:srinivasa_crm_new/src/features/login/domain/models/password_field.dart';


@injectable
class UpdateCubit extends Cubit<UpdatePasswordState> {
  UpdateCubit() : super(UpdatePasswordState.initial());


  final TextEditingController _passController = TextEditingController();

  TextEditingController get passController  => _passController;


  final TextEditingController _confirmPassController = TextEditingController();

  TextEditingController get confirmPassController  => _confirmPassController;




  void onChangePassword({required String? value}) {
    emit(state.copyWith(passwordField: PasswordField(value ?? "")));
  }

   void onChangeConfirmPassword({required String? value}) {
    emit(state.copyWith(confirmField: PasswordField(value ?? "")));
  }

  void onChangedPasswordtoggle() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

    void onChangedConfirmPasswordtoggle() {
    emit(state.copyWith(showConfirmPassword: !state.showConfirmPassword));
  }





  void onSubmit({required BuildContext context,required VoidCallback successCallback}) {
    final password = state.passwordField.value.isRight();
    final confirmPassword = state.passwordField.value.isRight();


    if(password && confirmPassword) {
      successCallback();
    }else{
      emit(state.copyWith(showInputError: true));
    }
  } 


  void resetPassword() {
    _passController.clear();
    _confirmPassController.clear();
    emit(UpdatePasswordState.initial());
  }


  @override
  Future<void> close() {
    _passController.dispose();
    _confirmPassController.dispose();
    return super.close();
  }
}