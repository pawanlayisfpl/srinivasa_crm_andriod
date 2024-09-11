// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import '../../common.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  const EmptyWidget({
    super.key,
    required this.title,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  <Widget>[
        FractionallySizedBox(
          child: Lottie.asset('assets/lottie/empty.json'),
        ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            )
          ),
          20.verticalSpace,
          CommonButton(title: 'Retry', callback: () => callback()),
        ],  
      ).withSymetricPadding(horizontalPadding: 10.w),
    );
  }
}
