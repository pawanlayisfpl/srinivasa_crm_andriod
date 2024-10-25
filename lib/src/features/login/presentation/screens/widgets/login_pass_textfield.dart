import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/widgets/textfields/common_password_textfield.dart';

import '../../../../../common/common.dart';
import '../../cubit/login_cubit.dart';
import '../../cubit/login_state.dart';



class LoginPasswordTextfieldWidget extends StatelessWidget {
  const LoginPasswordTextfieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return 
        CommonPasswordTextField(textEditingController: context.watch<LoginCubit>().passwordController, onChanged: (value) =>   context.read<LoginCubit>().passwordChanged(value), validator: (val) => state.passwordField.value.fold((l) => l.maybeMap(orElse: () => null,empty: (value) => 'Password is empty',), (r) => null), hintText: 'Enter password',labelText: 'Password', obscureText: state.hidePassword, autovalidateMode: state.showError ? AutovalidateMode.always: AutovalidateMode.onUserInteraction, onToggleObscure:  context.read<LoginCubit>().toggleHidePassword);
        // CommonTextfield(
        

        //   textInputType: TextInputType.text,
        //   textEditingController: context.watch<LoginCubit>().passwordController, onChanged: (String? value) {
        //   if(value != null) {
        //   
        //   }
        // }, validator: (val) => state.passwordField.value.fold((l) => l.maybeMap(orElse: () => null,empty: (value) => 'Password is empty',), (r) => null), labelText: 'Password', hintText: "Enter your password", autovalidateMode: state.showError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction, isPasswordField: true,);
      },
    );
  }
}