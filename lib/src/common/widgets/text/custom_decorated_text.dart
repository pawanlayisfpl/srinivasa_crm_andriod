import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common.dart';

class CustomDecoratedText extends StatelessWidget {
  final String title;
  final int maxLines;
  final TextAlign align;
  final TextDecoration textDecoration;
  final double textSize;
  final FontWeight fontWeight;
  final Color textColor;
  final double wordsSpacing;
  final double letterSpacing;

  const CustomDecoratedText({super.key, 
    required this.title,
    this.maxLines = 1,
    this.align = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.textSize = 18.0,
    this.fontWeight = FontWeight.normal,
    this.textColor = Colors.black,
    this.wordsSpacing = 0.0,
    this.letterSpacing = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TextDecorationPainter(
        title,
        textDecoration,
        textSize,
        fontWeight,
        textColor,
        wordsSpacing,
        letterSpacing,
      ),
      child: Container(),
    );
  }
}

class _TextDecorationPainter extends CustomPainter {
  final String title;
  final TextDecoration textDecoration;
  final double textSize;
  final FontWeight fontWeight;
  final Color textColor;
  final double wordsSpacing;
  final double letterSpacing;

  _TextDecorationPainter(
    this.title,
    this.textDecoration,
    this.textSize,
    this.fontWeight,
    this.textColor,
    this.wordsSpacing,
    this.letterSpacing,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      decoration: textDecoration,
      fontSize: textSize,
      fontWeight: fontWeight,
      color: textColor,
      wordSpacing: wordsSpacing,
      letterSpacing: letterSpacing,
    );

    final textSpan = TextSpan(
      text: title,
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: double.infinity);
    final offset = Offset(0, textSize / 4); // Adjust the offset value to move the decoration line down
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class CustomDivider extends StatelessWidget {
  final String heading;

  const CustomDivider({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: heading,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 20.sp,
              letterSpacing: 0,
            ),
          ),
          textDirection: TextDirection.ltr,
        );

        textPainter.layout();

        final textWidth = textPainter.size.width;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextWidget(
              title: heading,
              fontWeight: FontWeight.w500,
              textColor: Colors.black,
              textSize: 20.sp,
              letterSpacing: 0,
            ),
            SizedBox(
              width: textWidth,
              child: const Divider(
                color: Colors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}
