import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/shared/presentations/Otp/presentations/screens/otp_screen.dart';
import 'package:srinivasa_crm_new/shared/presentations/cubit/forget_cubit.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import '../../../../../src/common/common.dart';
import '../../../../../src/config/config.dart';
import '../../../cubit/state/forget_password_state.dart';

class ForgetPasswordBodyWidget extends StatelessWidget {
  const ForgetPasswordBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: ( v) async {
        locator.get<ForgetPasswordCubit>().resetState();
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            CommonTextWidget(
              title: "Reset Password",
              fontWeight: FontWeight.bold,
              textSize: 28.sp,
              textColor: AppColors.primaryColor,
              letterSpacing: 1,
            ),
            20.verticalSpace,
            CommonTextWidget(
              title:
                  "Enter the email associated with your account and we\'ll send an email otp to reset your password. ",
              maxLines: 5,
              textColor: AppColors.hintHeadingColor,
              textSize: 14.sp,
            ),
            30.verticalSpace,
            CustomHeadingTextWidget(
              title: 'Email',
              textColor: AppColors.hintHeadingDarkColor,
            ),
            BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
              builder: (context, state) {
                return CommonTextfield(
                    textEditingController: context.read<ForgetPasswordCubit>().emailController,
                    hintText: 'Enter your email address',
                    textInputType: TextInputType.emailAddress,
                    autovalidateMode: state.showValidationError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
                    validator: (v) => state.emailField.value.fold((l) => l.maybeMap(orElse: () => null,empty: (c) => "Email is empty",invalidEmail: (c) => "Email is invalid"), (r) => null),
                    
                    onChanged: (String? value) {
                      context.read<ForgetPasswordCubit>().onChangeEmail(value: value);
                    });
              },
            ),
            15.verticalSpace,
            CommonButton(
                callback: () {
                 context.read<ForgetPasswordCubit>().onSubmit(context: context, successCallback: () {
                   Navigator.pushReplacement(context, ScaleRoute(screen: const OtpScreen()));
                 });
                },
                title: 'Send Otp'),
          ],
        ).withSymetricPadding(horizontalPadding: 20.w),
      ),
    );
  }
}
