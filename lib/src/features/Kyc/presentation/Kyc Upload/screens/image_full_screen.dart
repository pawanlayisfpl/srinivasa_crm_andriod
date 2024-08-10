// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:srinivasa_crm_new/src/core/core.dart';

class ImageFullScreen extends StatelessWidget {
  final Uint8List bytes;
  const ImageFullScreen({
    Key? key,
    required this.bytes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.black,
      
      ),
     
      body: Center(
        child: InteractiveViewer(child: Image.memory(bytes,fit: BoxFit.fitWidth,)),
      ).withSymetricPadding(horizontalPadding: 10.w),
    );
  }
}
