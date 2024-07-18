import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/screens/mark_attendance_screen.dart';


import '../../../../../common/common.dart';
import '../../../../../config/constants/app_colors.dart';
import '../../cubit/login_cubit.dart';
import '../../cubit/login_state.dart';
import 'login_email_textfield.dart';
import 'login_pass_textfield.dart';

class LoginBodyWidget extends StatelessWidget {
    static const platform = MethodChannel('com.example.srinivasa_crm_new');

  const LoginBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // if(state.isLoginSuccess == true) {
        //   Fluttertoast.showToast(msg: 'Login Success',backgroundColor: Colors.orange,textColor: Colors.white);
        // }


        if(state.isLoginSuccess == true) {
          QuickAlert.show(
 context: context,
 animType: QuickAlertAnimType.slideInDown,
 type: QuickAlertType.success,
 text: 'Login successfull!',
  title: 'Success',
  showConfirmBtn: true,
  onConfirmBtnTap: () async {
  //    if(Platform.isAndroid) {

  //       Future<void> requestPermissions() async {
  //   Map<Permission, PermissionStatus> statuses = await [
  //     Permission.location,
  //     Permission.storage,

  //     Permission.locationWhenInUse,
  //     Permission.ignoreBatteryOptimizations,

  //     // Add other permissions required by your app
  //   ].request();

  //   // Check if all permissions are granted
  //   if (statuses.values.every((status) => status.isGranted)) {
  //     print("All permissions granted");
  //   } else {
  //     print("Not all permissions were granted");
  //     // Handle the case where permissions are not granted
  //   }
  // }
  //        try {
  //     await requestPermissions();
  //      // Request permissions before starting the service
  //     await platform.invokeMethod('start');
  //     print('Service started');
  //   } on PlatformException catch (e) {
  //     print('Failed to start service: ${e.message}');
  //   }
  //     }
    Navigator.pop(context);
    if(context.mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const MarkAttendanceScreen(isCheckedInScreen: true,)));
    }
  },
);
        }


        if(state.isLoginFailed == true){
          QuickAlert.show(
  context: context,
  type: QuickAlertType.error,
  text: state.apiFailedModel!.errorMessage.toString(),
  title: "Error",
  animType: QuickAlertAnimType.slideInUp,

);
        }

       

        
      },
      builder: (context, state) {
        return context.watch<LoginCubit>().state.isLoading ? const CustomLoadingWidget() :  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.1.sh,),
              Lottie.asset('assets/lottie/login.json',height: 0.35.sh,width: double.infinity,fit: BoxFit.fitHeight,).alignToCenter(),
              10.verticalSpace,
              const LoginEmailTextFieldWidget(),
              20.verticalSpace,
              const LoginPasswordTextfieldWidget(),
                10.verticalSpace,
             SizedBox(
                width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox.adaptive(
                      value: state.isRememberMe, onChanged: (bool? value) {
                        context.read<LoginCubit>().toggleisRememberMe();
                      } ),
                   const CommonTextWidget(title: 'Remember me',textColor: AppColors.primaryColor,fontWeight: FontWeight.w500,)
                  ],
                ),
              ),
              20.verticalSpace,
              CommonButton(callback: () async {
                    HapticFeedback.lightImpact();
                if(context.mounted) {
                  context.read<LoginCubit>().login();
                }
              }, title: 'Login'),
            
        
              
            ],
          ).withSymetricPadding(horizontalPadding: 20.w),
        );
      },
    );
  }
}