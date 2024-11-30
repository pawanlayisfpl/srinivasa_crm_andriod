// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

import 'package:srinivasa_crm_new/shared/domain/repo/Forget%20Password/forget_password_repo.dart';
import 'package:srinivasa_crm_new/src/config/constants/key_value_strings.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/login/domain/models/email_field.dart';

import 'state/forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo forgetPasswordRepo;
  final KeyValueStorage keyValueStorage;
  ForgetPasswordCubit(
    this.forgetPasswordRepo,
    this.keyValueStorage,
  ) : super(ForgetPasswordState.initial());


  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController  => _emailController;


  void getExistingEmail() {
    String? email = keyValueStorage.sharedPreferences.getString(KeyValueStrings.email);
    _emailController.text = email ?? "";
    emit(state.copyWith(emailField:  EmailField(email ?? "")));
  }


  void onChangeEmail({required String? value}) {
    emit(state.copyWith(emailField: EmailField(value ?? "")));
  }


  void onSubmit({required BuildContext context,required VoidCallback successCallback})  async {
    final email = state.emailField.value.isRight();


    if(email) {
     emit(state.copyWith(isSubmitting: true));
     await Future.delayed(const Duration(milliseconds: 800));

     
      FindEmailPostModel findEmailPostModel = FindEmailPostModel(email: _emailController.text.toLowerCase().trim().toString());
    final results = await  forgetPasswordRepo.findEmail(findEmailPostModel: findEmailPostModel);
    results.fold((l) {
      ApiFailedModel apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);  
          Fluttertoast.showToast(msg: apiFailedModel.message.toString(),backgroundColor: Colors.red,textColor: Colors.white,toastLength: Toast.LENGTH_LONG);
      emit(state.copyWith(isSubmitting: false));

    }, (r) => {
     emit(ForgetPasswordState.initial()),
     _emailController.clear(),
     Fluttertoast.showToast(msg: 'Otp send to to email successfully',backgroundColor: Colors.green,textColor: Colors.white),
     successCallback()
    });

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
    _emailController.dispose();
    return super.close();
  }
}
