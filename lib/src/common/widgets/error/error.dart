

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

class CommonErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback callback;
  const CommonErrorWidget({
    super.key,
    required this.error,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(error),
            ),
            10.verticalSpace,
            ElevatedButton(
              onPressed:  callback,
              child: const Text("Retry"),
            )
          ],
        ).withSymetricPadding(horizontalPadding: 10.w),
      ),
    );
  }
}
