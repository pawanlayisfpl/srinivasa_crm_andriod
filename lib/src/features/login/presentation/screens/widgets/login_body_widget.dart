import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';


import '../../../../../common/common.dart';
import '../../../../../config/constants/app_colors.dart';
import '../../cubit/login_cubit.dart';
import '../../cubit/login_state.dart';
import 'login_email_textfield.dart';
import 'login_pass_textfield.dart';

class LoginBodyWidget extends StatelessWidget {
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
 text: 'Login was successfull!',
  title: 'Success',
  showConfirmBtn: true,
  onConfirmBtnTap: () async {
    Navigator.pop(context);
  },
);
        }


        if(state.isLoginFailed == true){
          QuickAlert.show(
  context: context,
  type: QuickAlertType.error,
  text: state.apiFailedModel!.message.toString(),
  title: state.apiFailedModel!.statusCode.toString(),
  animType: QuickAlertAnimType.slideInUp,

);
        }
//         if(state.showError == true) {

//            QuickAlert.show(
//   context: context,
//   type: QuickAlertType.error,
//   text: 'Missing Credentails',
//   animType: QuickAlertAnimType.slideInUp
// );
//         }


        // if(state.showError == true) {
        //   Fluttertoast.showToast(msg: 'Please enter valid email and password',backgroundColor: Colors.orange,textColor: Colors.white);
        // }

       

        
      },
      builder: (context, state) {
        return Center(
      child: context.watch<LoginCubit>().state.isLoading ? const CircularProgressIndicator() :  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/png/login.png',height: 0.18.sh,width: 0.9.sw,fit: BoxFit.fitHeight,).alignToCenter(),
            // Image.asset('assets/png/login.png',height: 0.18.sh,width: 0.9.sw,fit: BoxFit.fitHeight,).alignToCenter(),
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
              if(context.mounted) {
                context.read<LoginCubit>().login();
              }
            }, title: 'Login'),
          
      
            
          ],
        ).withSymetricPadding(horizontalPadding: 20.w),
      ),
    );
      },
    );
  }
}