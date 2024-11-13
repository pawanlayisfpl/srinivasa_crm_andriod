import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/shared/presentations/Update%20Password/presentations/cubit/state/update_password_state.dart';
import 'package:srinivasa_crm_new/shared/presentations/Update%20Password/presentations/cubit/update_cubit.dart';
import 'package:srinivasa_crm_new/src/common/widgets/textfields/common_password_textfield.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import '../../../../../src/common/common.dart';

class UpdatePasswordBodyWidget extends StatelessWidget {
  const UpdatePasswordBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (v) {
        context.read<UpdateCubit>().resetPassword();
      },
      child: BlocBuilder<UpdateCubit, UpdatePasswordState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                CommonTextWidget(
                  title: "Create new Password",
                  fontWeight: FontWeight.bold,
                  textSize: 28.sp,
                  textColor: AppColors.primaryColor,
                  letterSpacing: 1,
                ),
                20.verticalSpace,
                CommonTextWidget(
                  title:
                      "Your new password must be different from previous used passwords. ",
                  maxLines: 5,
                  textColor: AppColors.hintHeadingColor,
                  textSize: 14.sp,
                ),
                30.verticalSpace,
                CustomHeadingTextWidget(
                  title: 'Old Password',
                  textColor: AppColors.hintHeadingDarkColor,
                ),
               
                    // password
                       CommonPasswordTextField(
                        
                      
                  validator: (c) => state.passwordField.value.fold((l) => l.maybeMap(orElse: () {},empty: (c) => "Password is empty"), (r) => null),
                  autovalidateMode: state.showInputError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
                    textEditingController: context.watch<UpdateCubit>().passController,
                    hintText: 'Enter old password',
                    onChanged: (String? value) {
                      context.read<UpdateCubit>().onChangePassword(value: value);
                    }, obscureText: state.showPassword,  onToggleObscure: () { 
                      context.read<UpdateCubit>().onChangedPasswordtoggle();
                     },),
                15.verticalSpace,
                CustomHeadingTextWidget(
                  title: 'New Password',
                  textColor: AppColors.hintHeadingDarkColor,
                ),
               // password
                       CommonPasswordTextField(
                        
                      
                  validator: (c) => state.confirmField.value.fold((l) => l.maybeMap(orElse: () {},empty: (c) => "Confirm password is empty",), (r) => null),
                  autovalidateMode: state.showInputError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
                    textEditingController: context.watch<UpdateCubit>().confirmPassController,
                    hintText: 'Enter new password',
                    onChanged: (String? value) {
                      context.read<UpdateCubit>().onChangeConfirmPassword(value: value);
                    }, obscureText: state.showConfirmPassword,  onToggleObscure: () { 
                      context.read<UpdateCubit>().onChangedConfirmPasswordtoggle();
                     },),
                    //  if(context.watch<UpdateCubit>().state.passwordField.value.isRight() && context.watch<UpdateCubit>().passController.text.toString() != context.watch<UpdateCubit>().confirmPassController.text.toString() && context.watch<UpdateCubit>().confirmPassController.text.isNotEmpty)...[
                      // 5.verticalSpace,
                      // CommonTextWidget(title: 'Both password are not matching',textSize: 12.sp,textColor: Colors.red.shade700,fontWeight: FontWeight.w400,).withPadding(left: 16.w),
                      // 5.verticalSpace,
                    //  ],
                20.verticalSpace,
                CommonButton(
                    callback: () {
                      context.read<UpdateCubit>().onSubmit(context: context, successCallback: () async {
                         Navigator.pop(context);
                      });
                     
                    },
                    title: 'Update Password'),
              ],
            ).withSymetricPadding(horizontalPadding: 20.w),
          );
        },
      ),
    );
  }
}
