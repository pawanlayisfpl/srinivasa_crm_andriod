// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SearchCustomerEmptyWidget extends StatelessWidget {
  final String? text;
  const SearchCustomerEmptyWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Lottie.asset('assets/lottie/empty_customer.json',height: 0.26),),
          20.verticalSpace,
         Text(text ?? 'No Customer Found', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
         
      ],
    );
  }
}
