// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:srinivasa_crm_new/src/core/extensions/extensions.dart';
import '../../common.dart';


class CustomDropDownErorTextWidget extends StatelessWidget {
  final String? title;
  const CustomDropDownErorTextWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return title == null
        ? const SizedBox()
        : CommonTextWidget(
                textSize: 12,
                title: title.toString(),
                fontWeight: FontWeight.w400,
                textColor: const Color.fromARGB(255, 181, 33, 33))
            .withPadding(left: 14, top: 10)
            .alignToCenterLeft();
  }
}
