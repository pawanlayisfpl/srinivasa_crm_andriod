import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import '../../../../../src/common/common.dart';
import '../../../Otp/presentations/screens/otp_screen.dart';




class UpdatePasswordBodyWidget extends StatelessWidget {
  const UpdatePasswordBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center
        ,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          20.verticalSpace,
          CommonTextWidget(title: "Create new Password",fontWeight: FontWeight.bold,textSize: 28.sp,),
          20.verticalSpace,
            CommonTextWidget(title: "Your new password must be different from previous used passwords. ",maxLines: 5,textColor: Colors.grey,textSize: 14.sp,),
          30.verticalSpace,
            CustomHeadingTextWidget(title: 'Password',),
            CommonTextFormFieldWidget(textEditingController: TextEditingController(), hintText: 'Enter password', onChanged: (String? value) {}),
            15.verticalSpace,
              CustomHeadingTextWidget(title: 'Confirm Password',),
            CommonTextFormFieldWidget(textEditingController: TextEditingController(), hintText: 'Re-enter password', onChanged: (String? value) {}),
            20.verticalSpace,
            CommonButton(callback: () {
              Navigator.push(context, ScaleRoute(screen: OtpScreen()));
            }, title: 'Update Password'),





        ],
      ).withSymetricPadding(horizontalPadding: 20.w),
    );
  }
}