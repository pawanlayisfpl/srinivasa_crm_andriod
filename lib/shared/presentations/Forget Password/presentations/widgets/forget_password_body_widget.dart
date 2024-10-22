import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/shared/presentations/Otp/presentations/screens/otp_screen.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import '../../../../../src/common/common.dart';
import '../../../Update Password/presentations/screens/update_password_screen.dart';




class ForgetPasswordBodyWidget extends StatelessWidget {
  const ForgetPasswordBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center
        ,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          20.verticalSpace,
          CommonTextWidget(title: "Reset Password",fontWeight: FontWeight.bold,textSize: 28.sp,),
          20.verticalSpace,
            CommonTextWidget(title: "Enter the email associated with your account and we\'ll send an email otp to reset your password. ",maxLines: 5,textColor: Colors.grey,textSize: 14.sp,),
          30.verticalSpace,
            const CustomHeadingTextWidget(title: 'Email',),
            CommonTextFormFieldWidget(textEditingController: TextEditingController(), hintText: 'Enter your email address', onChanged: (String? value) {}),
            15.verticalSpace,
            CommonButton(callback: () {
              Navigator.push(context,ScaleRoute(screen: const OtpScreen()));
            }, title: 'Send Otp'),





        ],
      ).withSymetricPadding(horizontalPadding: 20.w),
    );
  }
}