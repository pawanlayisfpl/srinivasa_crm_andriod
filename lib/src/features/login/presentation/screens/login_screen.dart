import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/constants/key_value_strings.dart';
import 'package:srinivasa_crm_new/src/config/locator/locator.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/screens/mark_attendance_screen.dart';

import '../cubit/login_cubit.dart';
import 'widgets/login_body_widget.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async { 
      String? token =   locator.get<KeyValueStorage>().sharedPreferences.getString(KeyValueStrings.token);

      if(token != null) {
     await   Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const MarkAttendanceScreen(isCheckedInScreen: true,)));
      }else {
     await context.read<LoginCubit>().getInitialValues();

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

appBar: AppBar(
  automaticallyImplyLeading: false,
  title:CommonTextWidget(title: 'SRINIVASA CRM',fontWeight: FontWeight.w600,textColor: Colors.white,textSize: 22.sp,letterSpacing: 2,),
  centerTitle: true,
),
      
      body: SafeArea(child: LoginBodyWidget()));
  }
}