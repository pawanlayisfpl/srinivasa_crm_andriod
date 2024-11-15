import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/config.dart';

class CommonTextfield extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String) onChanged;
  final Function(String?) validator;
  final VoidCallback? onTapFunction; 
  final String? labelText;
  final String hintText;
  final bool? obscureText;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final TextInputAction? textInputAction;
  final AutovalidateMode autovalidateMode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final int? maxLines;
  final bool? isPasswordField;
  final ValueNotifier<bool> obscureNotifier;
  final int? maxLength;
  

  CommonTextfield(
      {super.key,
      required this.textEditingController,
      this.onTapFunction,
      required this.onChanged,
      required this.validator,
       this.labelText,
      required this.hintText,
      this.obscureText,
      this.textInputType,
      this.inputFormatters,
      this.readOnly,
      this.maxLength,
      this.textInputAction,
      required this.autovalidateMode,
      this.suffixIcon,
      this.maxLines,
      this.prefixIcon,
      this.isPasswordField,
      this.fillColor})  : obscureNotifier = ValueNotifier<bool>(obscureText ?? false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureNotifier,
      builder: (context, value, child) {
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
            obscureText: value,
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
              suffixIcon: isPasswordField == true
                  ? IconButton(
                      onPressed: () {
                        obscureNotifier.value = !value;
                      },
                      icon: Icon(
                        value ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    )
                  : null,
              prefixIcon: prefixIcon,
              border: AppStyles.inputBorder,
              focusedBorder: AppStyles.focusBorder,
              fillColor: Colors.grey.shade100,
              
              filled: fillColor != null  ? true : false,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              alignLabelWithHint: true,
              labelStyle: AppStyles.labelStyle),
          ),
        );
      },
    );
  }
}