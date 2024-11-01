// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/quickalert.dart';

import 'package:srinivasa_crm_new/shared/domain/repo/Forget%20Password/forget_password_repo.dart';
import 'package:srinivasa_crm_new/shared/presentations/Otp/presentations/cubit/state/otp_state.dart';
import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/common/fields/string_field.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/config/constants/key_value_strings.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/login/presentation/screens/login_screen.dart';

@injectable
class OtpCubit extends Cubit<OtpState> {
  final ForgetPasswordRepo forgetPasswordRepo;
  final KeyValueStorage keyValueStorage;
  OtpCubit(
    this.forgetPasswordRepo,
    this.keyValueStorage,
  ) : super(OtpState.initial());


  final TextEditingController _otpController = TextEditingController();

  TextEditingController get otpcontroller  => _otpController;


  final TextEditingController _passController = TextEditingController();

  TextEditingController get passController  => _passController;




  void onChangeOtp({required String? value}) {
    emit(state.copyWith(numberField: NumberField(value ?? "")));
  }


  void onChangePass({required String? value}) {
    emit(state.copyWith(passwordField: StringField(value ?? "")));
  }





  void onSubmit({required BuildContext context,required VoidCallback successCallback}) async {
    final otpVlaid = state.numberField.value.isRight();
    final password= state.passwordField.value.isRight();


    if(otpVlaid && password) {
      String? email = keyValueStorage.sharedPreferences.getString(KeyValueStrings.forgetEmail);
      ResetPassPostModel resetPassPostModel  = ResetPassPostModel();
      resetPassPostModel.email = email ?? "";
      resetPassPostModel.otp = _otpController.text.toString();
      resetPassPostModel.newPassword = _passController.text.trim();
      emit(state.copyWith(isSubmitting:  true));
      if(context.mounted) {
        await keyValueStorage.sharedPreferences.setString(KeyValueStrings.email, email ?? "");
        await keyValueStorage.sharedPreferences.setString(KeyValueStrings.password, _passController.text.trim());
        QuickAlert.show(context: context, type: QuickAlertType.loading);
        await Future.delayed(const Duration(milliseconds: 800));
        final results = await forgetPasswordRepo.resetPass(resetPassPostModel: resetPassPostModel);

        results.fold((l) {
          ApiFailedModel apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);        
            Navigator.pop(context);
          if(context.mounted) {

            QuickAlert.show(context: context, type: QuickAlertType.error,title: 'Something went wrong',text: apiFailedModel.message.toString(),onConfirmBtnTap: () {
              Navigator.pop(context);
            });

          }
        }, (r) {
          emit(OtpState.initial());
          _otpController.clear();
          _passController.clear();
           Navigator.pop(context);
          if(context.mounted) {
            QuickAlert.show(
              disableBackBtn: true,
              barrierDismissible: false,
              confirmBtnColor: Colors.black,
              context: context, type: QuickAlertType.success,animType: QuickAlertAnimType.slideInUp,title: "Password Changed",text: "Please login again",onConfirmBtnTap: () {
              Navigator.canPop(context);
              if(context.mounted) {
                Navigator.pushAndRemoveUntil(context, ScaleRoute(screen: const LoginScreen()), (t) => false);
              }

            });
            
            
          }
        });
      }
    }else{
      emit(state.copyWith(showInputError: true));
    }
  } 

  void resetState( ) {
    emit(OtpState.initial());
    _otpController.clear();
    _passController.clear();
  }

@override
  Future<void> close() {
    _otpController.dispose();
    _passController.dispose();
    return super.close();
  }
}
