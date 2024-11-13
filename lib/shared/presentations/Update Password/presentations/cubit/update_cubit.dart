// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/quickalert.dart';

import 'package:srinivasa_crm_new/shared/domain/repo/Forget%20Password/forget_password_repo.dart';
import 'package:srinivasa_crm_new/shared/presentations/Update%20Password/presentations/cubit/state/update_password_state.dart';
import 'package:srinivasa_crm_new/src/config/constants/key_value_strings.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/login/domain/models/password_field.dart';
import 'package:srinivasa_crm_new/src/features/login/domain/models/update_password_post_model.dart';

@injectable
class UpdateCubit extends Cubit<UpdatePasswordState> {
  final ForgetPasswordRepo forgetPasswordRepo;
  final KeyValueStorage keyValueStorage;
  UpdateCubit(
    this.forgetPasswordRepo,
    this.keyValueStorage,
  ) : super(UpdatePasswordState.initial());


  final TextEditingController _passController = TextEditingController();

  TextEditingController get passController  => _passController;


  final TextEditingController _confirmPassController = TextEditingController();

  TextEditingController get confirmPassController  => _confirmPassController;


  void onGetInitialData() async {
    emit(state.copyWith(showInputError: false));
    String? password =   keyValueStorage.sharedPreferences.getString(KeyValueStrings.password);
    if(password != null) {
      _passController.text = password;
      emit(state.copyWith(passwordField: PasswordField(password)));
    }
  }

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





  void onSubmit({required BuildContext context,required VoidCallback successCallback}) async {
    final password = state.passwordField.value.isRight();
    final confirmPassword = state.passwordField.value.isRight();


    if(password && confirmPassword) {

      if(_confirmPassController.text.length < 8) {
        emit(state.copyWith(showInputError: true));
        QuickAlert.show(context: context, type: QuickAlertType.error,text: 'Password must be at least 8 characters long',title: 'Error');
      }else {
         if(context.mounted) {
        QuickAlert.show(context: context, type: QuickAlertType.loading);
        UpdatePassPostModel updatePassPostModel = UpdatePassPostModel(oldPassword: _passController.text.toLowerCase().trim(), newPassword: _confirmPassController.text.toLowerCase().trim());
      final results = await forgetPasswordRepo.updatePassword(updatePassPostModel: updatePassPostModel);
      results.fold((l) {
        if(context.mounted) {
          Navigator.pop(context);
          if(context.mounted) {
        emit(state.copyWith(showInputError: true));
        ApiFailedModel apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);
          QuickAlert.show(context: context, type: QuickAlertType.error,text:  apiFailedModel.errorMessage,title: apiFailedModel.message.toString());

          }
        }
      }, (r) async {
        await keyValueStorage.sharedPreferences.setString(KeyValueStrings.password, _confirmPassController.text.toLowerCase().trim());
        if(context.mounted) {
          Navigator.pop(context);
          if(context.mounted) {
            QuickAlert.show(context: context, type: QuickAlertType.success,text: 'Password updated successfully',title: 'Success',showConfirmBtn: true,onConfirmBtnTap: () async {
  if(context.mounted) {
              Navigator.pop(context);
              if(context.mounted) {
                Navigator.pop(context);
              }

  }            });
          }
        }
      });
      }
      }
      
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
