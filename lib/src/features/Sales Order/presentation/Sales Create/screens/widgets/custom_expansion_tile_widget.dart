// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';

import '../../../../../../common/common.dart';

class CustomExpansionTileWidget extends StatelessWidget {
  final String heading;
  final List<Widget> childrens;
  const CustomExpansionTileWidget({
    super.key,
    required this.heading,
    required this.childrens,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
       backgroundColor: Colors.white,
       childrenPadding: EdgeInsets.symmetric(horizontal: 15.w),
        enableFeedback: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
           side: BorderSide(color: AppColors.primaryColor, width: 1.2.w),
        ), 
        collapsedIconColor: Colors.grey,
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
           side: BorderSide(color: Colors.black, width: 1.w),
        ),
    
      expandedAlignment: Alignment.centerLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      collapsedTextColor: AppColors.primaryColor,
      textColor: AppColors.primaryColor,
      title:    CommonTextWidget(title: heading,fontWeight: FontWeight.w600,letterSpacing: 0, maxLines: 1, wordsSpacing: 0,textColor: AppColors.primaryColor,),children: childrens,);
  }
}
