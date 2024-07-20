import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

class ImageFullScreen extends StatelessWidget {
  final File file;
  const ImageFullScreen({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.black,
      
      ),
     
      body: Center(
        child: InteractiveViewer(child: Image.file(File(file.path),fit: BoxFit.fitWidth,)),
      ).withSymetricPadding(horizontalPadding: 10.w),
    );
  }
}