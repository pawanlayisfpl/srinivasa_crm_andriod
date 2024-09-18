// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

class CustomHeadingTextWidget extends StatelessWidget {
  final String title;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? letterSpacing;
  final double? wordsSpacing;
  final TextDecoration? textDecoration;
  final TextAlign? align;

  const CustomHeadingTextWidget({
    super.key,
    required this.title,
    this.textColor,
    this.textSize,
    this.fontWeight,
    this.maxLines,
    this.letterSpacing,
    this.wordsSpacing,
    this.textDecoration,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          title,
          maxLines: maxLines,
          textAlign: align ?? TextAlign.start,
          style: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: textSize ?? 18.sp,
              fontWeight: fontWeight ?? FontWeight.w600,
              overflow: TextOverflow.ellipsis,
              wordSpacing: wordsSpacing,
              letterSpacing: letterSpacing),
        ),
        if (textDecoration == TextDecoration.underline)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 1, // This is your underline thickness
              color: textColor ?? Colors.black,
              margin: const EdgeInsets.only(top: 10), // This is your gap
            ),
          ),
      ],
    ).withPadding(bottom: 8.0, left: 5.0);
  }
}
