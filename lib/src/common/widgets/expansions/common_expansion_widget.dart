// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/config.dart';

class CommonExpansionWidget extends StatelessWidget {
  final String title;
  final List<Widget> childersnWidgets;
  final bool? isValidated;

  final bool isExpanded;

  const CommonExpansionWidget({
    super.key,
    required this.title,
    required this.childersnWidgets,
    this.isValidated,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.primaryColor),
      ),
      margin: const EdgeInsets.only(
        bottom: 8,
        left: 20,
        right: 20,
      ),
      padding: const EdgeInsets.all(4),
      child: ExpansionTile(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        backgroundColor: Colors.white,
        collapsedShape: const RoundedRectangleBorder(),
        title: Text(
          title,
          style: const TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.w600),
        ),
        childrenPadding: EdgeInsets.symmetric(horizontal: 20.w),
        controlAffinity: ListTileControlAffinity.trailing,
        iconColor: AppColors.primaryColor,
        collapsedIconColor: AppColors.primaryColor,
        initiallyExpanded: isExpanded,
        controller: ExpansionTileController(),
        children: childersnWidgets,
      ),
    );
  }
}
