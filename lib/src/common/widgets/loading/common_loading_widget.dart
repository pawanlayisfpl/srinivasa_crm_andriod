import 'package:flutter/material.dart';

import '../../../config/config.dart';

class CustomLoadingWidget extends StatelessWidget {
  
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
        strokeWidth: 2,
      ),
    );
  }
}
