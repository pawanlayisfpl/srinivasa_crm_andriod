// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextWidget extends StatelessWidget {
  final String title;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? letterSpacing;
  final double? wordsSpacing;
  final TextDecoration? textDecoration;
  final TextAlign? align;

  const CommonTextWidget({
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
    return Text(
      title,
      maxLines: maxLines,
      textAlign: align ?? TextAlign.start,
      
      style: TextStyle(
         decorationStyle: TextDecorationStyle.solid,
          decorationThickness: 1,
           
          decorationColor: textColor ?? Colors.black,
          color: textColor ?? Colors.black,
          decoration: textDecoration,
          fontSize: textSize ?? 18.sp,
          fontWeight: fontWeight ?? FontWeight.normal,
          overflow: TextOverflow.ellipsis,
          wordSpacing: wordsSpacing,

          letterSpacing: letterSpacing),
    );
  }
}
