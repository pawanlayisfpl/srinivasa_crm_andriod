// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

class CommonSvgPicture extends StatelessWidget {
  final String path;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final Color? svgColor;

  const CommonSvgPicture({
    super.key,
    required this.path,
    this.boxFit,
    this.height,
    this.width,
    this.svgColor,
  });

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return SvgPicture.asset(path.toSvg());
    } else {
      return SvgPicture.asset(path.toSvg());
    }
  }
}
