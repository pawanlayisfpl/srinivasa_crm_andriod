import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/common.dart';
import '../../cubit/login_cubit.dart';
import '../../cubit/login_state.dart';


class LoginEmailTextFieldWidget extends StatelessWidget {
  const LoginEmailTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return  CommonTextfield(textEditingController: context.watch<LoginCubit>().emailController, onChanged: (String? value) {
          if(value != null) {
            context.read<LoginCubit>().emailChanged(value.trim().toString());
          }
        }, validator: (val) => state.emailField.value.fold((l) => l.maybeMap(orElse: () => null,empty: (_) => "Email is empty",invalidEmail: (_) => 'Invalid email'), (r) => null), labelText: "Email", hintText: "Enter your email", autovalidateMode: state.showError ? AutovalidateMode.disabled : AutovalidateMode.disabled, textInputAction: TextInputAction.next,);
      },
    );
  }
}