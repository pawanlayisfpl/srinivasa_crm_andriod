import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/shared/presentations/Otp/presentations/cubit/otp_cubit.dart';
import 'package:srinivasa_crm_new/shared/presentations/Otp/presentations/cubit/state/otp_state.dart';
import 'package:srinivasa_crm_new/shared/presentations/Update%20Password/presentations/screens/update_password_screen.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import '../../../../../src/common/common.dart';



class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : const Text("Otp ")),
      
      body: PopScope(
        onPopInvoked: (t) {
          context.read<OtpCubit>().resetState();
        },
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center
          ,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            20.verticalSpace,
            CommonTextWidget(title: "Otp",fontWeight: FontWeight.bold,textSize: 28.sp,textColor: AppColors.primaryColor,letterSpacing: 1,),
            20.verticalSpace,
              CommonTextWidget(title: "Enter the otp which you received on your offical email address and new password also. ",maxLines: 5,textColor: AppColors.hintHeadingColor,textSize: 14.sp,),
            30.verticalSpace,
               CustomHeadingTextWidget(title: 'Otp',textColor: AppColors.hintHeadingDarkColor,),
              CommonTextfield(
                
                autovalidateMode: context.watch<OtpCubit>().state.showInputError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
                validator: (c) => context.watch<OtpCubit>().state.numberField.value.fold((l) => l.maybeMap(orElse: () => null,empty: (c) => "Otp is empty"), (r) => null),
                
                textInputType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(6)],
                textEditingController:  context.watch<OtpCubit>().otpcontroller, hintText: 'Enter otp', onChanged: (String? value) {
                context.read<OtpCubit>().onChangeOtp(value: value);
              }),
              15.verticalSpace,
                CustomHeadingTextWidget(title: 'Password',textColor: AppColors.hintHeadingDarkColor,),
              BlocBuilder<OtpCubit, OtpState>(
        builder: (context, state) {
          return CommonTextfield(
              textEditingController:
                  context.read<OtpCubit>().passController,
              onChanged: (value) {
                context
                    .read<OtpCubit>()
                    .onChangePass(value: value);
              },
              validator: (val) =>
                  state.passwordField.value.fold(
                      (l) => l.maybeMap(
                            orElse: () => null,
                            empty: (value) => "Password is empty",
                            tooShort: (value) => "Password is too short",
                          ),
                      (r) => null),
              hintText: "Enter new password",
              autovalidateMode: state.showInputError
                  ? AutovalidateMode.always
                  : AutovalidateMode.onUserInteraction);
        },
            ),
              15.verticalSpace,
              
              CommonButton(callback: () {
                context.read<OtpCubit>().onSubmit(context: context, successCallback: () async {
                  if(context.mounted ) {
                Navigator.push(context, SlideLeftRoute(screen: const UpdatePasswordScreen()));
        
                  }
                });
              }, title: 'Submit'),
        
        
        
        
        
          ],
        ).withSymetricPadding(horizontalPadding: 20.w),
            ),
      ),);
  }
}