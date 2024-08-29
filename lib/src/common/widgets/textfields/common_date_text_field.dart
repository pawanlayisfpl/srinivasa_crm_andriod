// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../config/config.dart';


// ignore: must_be_immutable
class CommonDateTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Function(String?)? onChanged;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool? isLabelEnabled;
  final String? labeltitle;
  final Color? labelColor;
  final int? maxLines;
  InputBorder? inputBorder;
  final bool? isObscureText;
  final bool? isAutoFoucsEnabled;
  final String? errorText;
  final VoidCallback onTap;
  CommonDateTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.onChanged,
    this.inputType,
    this.inputAction,
    this.isLabelEnabled,
    this.labeltitle,
    this.labelColor,
    this.maxLines,
    this.inputBorder,
    this.isObscureText,
    required this.onTap,
    this.isAutoFoucsEnabled,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      onTap:  onTap,
      autofocus: isAutoFoucsEnabled ?? false,
      controller: textEditingController,
      onChanged: onChanged,
      cursorColor: AppColors.primaryColor,
      textInputAction: inputAction ?? TextInputAction.next,
      keyboardType: inputType,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () => onTap,
          icon: const Icon(
            Icons.calendar_month,
            color: AppColors.primaryColor,
          ),
        ),
        alignLabelWithHint: true,

        hintText: hintText,
        fillColor: Colors.white,
        filled: true,

        hintStyle: TextStyle(
            color: Colors.black,
            fontWeight: textEditingController.text.isNotEmpty
                ? FontWeight.bold
                : FontWeight.normal),
        errorText: errorText, // Show error text
        border: inputBorder ??
            const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: Colors.grey, width: 1.5),
            ),

        disabledBorder: inputBorder ??
            const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: Colors.grey, width: 1.5),
            ),
        enabledBorder: inputBorder ??
            const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: Colors.grey, width: 1.5),
            ),
        focusedBorder: inputBorder ??
            const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
            ),
      ),
    );
  }
}
