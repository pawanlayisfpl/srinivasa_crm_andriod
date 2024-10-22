import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/config.dart';

class CommonPasswordTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String) onChanged;
  final Function(String?) validator;
  final VoidCallback? onTapFunction;
  final String? labelText;
  final String hintText;
  final bool obscureText;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final TextInputAction? textInputAction;
  final AutovalidateMode autovalidateMode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final int? maxLines;
  final int? maxLength;
  final VoidCallback onToggleObscure;

  CommonPasswordTextField({
    super.key,
    required this.textEditingController,
    this.onTapFunction,
    required this.onChanged,
    required this.validator,
    this.labelText,
    required this.hintText,
    required this.obscureText,
    this.textInputType,
    this.inputFormatters,
    this.readOnly,
    this.maxLength,
    this.textInputAction,
    required this.autovalidateMode,
    this.suffixIcon,
    this.maxLines,
    this.prefixIcon,
    this.fillColor,
    required this.onToggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shadowColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        autofocus: false,
        onTap: onTapFunction,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        readOnly: readOnly ?? false,
        cursorColor: AppColors.primaryColor,
        onChanged: onChanged,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        keyboardType: textInputType ?? TextInputType.text,
        textInputAction: textInputAction ?? TextInputAction.next,
        controller: textEditingController,
        autovalidateMode: autovalidateMode,
        validator: (value) => validator(value),
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: IconButton(
            onPressed: onToggleObscure,
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),
          prefixIcon: prefixIcon,
          border: AppStyles.inputBorder,
          focusedBorder: AppStyles.focusBorder,
          fillColor: Colors.grey.shade300,
          filled: fillColor != null ? true : false,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          alignLabelWithHint: true,
          labelStyle: AppStyles.labelStyle,
        ),
      ),
    );
  }
}
