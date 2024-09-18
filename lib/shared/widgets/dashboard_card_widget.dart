// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../src/config/config.dart';

class DashboardChildrenCardWidget extends StatelessWidget {
  final String title;
  const DashboardChildrenCardWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5),
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 20.w),
        height: 0.23.sh, // 13% of screen height
        width: 0.8.sw, // 90% of screen width
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryColor,
              Colors.blueAccent,
              Color.fromARGB(255, 0, 140, 255),
            ],
          ),
        ),
        alignment: Alignment.center,
        child:
            Text(title, style: TextStyle(fontSize: 24.sp, color: Colors.white),textAlign: TextAlign.center,),
      ),
    );
  }
}
