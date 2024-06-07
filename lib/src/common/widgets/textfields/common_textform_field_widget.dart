// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/config.dart';

class CommonTextFormFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormaters;
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
  final Widget? suffixIcon;

  // Updated: Use ValueNotifier<bool> for obscureText
  final ValueNotifier<bool> obscureNotifier;

  CommonTextFormFieldWidget({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.isAutoFoucsEnabled,
    required this.onChanged,
    this.inputFormaters,
    this.inputType,
    this.suffixIcon,
    this.inputBorder,
    this.inputAction,
    this.isLabelEnabled,
    this.labeltitle,
    this.labelColor,
    this.maxLines,
    this.isObscureText,
    this.errorText, // Added errorText property
  })  : obscureNotifier = ValueNotifier<bool>(isObscureText ?? false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureNotifier,
      builder: (context, isObscure, child) {
        return TextFormField(
          autofocus: isAutoFoucsEnabled ?? false,
          obscureText: isObscure,
          controller: textEditingController,
          onChanged: onChanged,
          
          cursorColor: AppColors.primaryColor,
          inputFormatters: inputFormaters,
          textInputAction: inputAction ?? TextInputAction.next,
          keyboardType: inputType,
          maxLines: maxLines,
          decoration: InputDecoration(
            fillColor: Colors.white, // Set fill color to white
            filled: true, // Set filled to true
            suffixIcon: isObscureText == true
                ? IconButton(
                    onPressed: () {
                      // Toggle the obscured state when the icon is pressed
                      obscureNotifier.value = !obscureNotifier.value;
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                : null,
            label: isLabelEnabled == true ? Text(labeltitle.toString()) : null,
            alignLabelWithHint: true,
            // labelStyle: TextStyle(
            //     color: errorText != null ? Colors.red : AppColors.primaryColor),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            errorText: errorText, // Show error text
            border: inputBorder ??
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
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 1.5),
                ),
          ),
        );
      },
    );
  }
}
