import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config.dart';

class AppStyles {
  static InputBorder inputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1),
      borderRadius: BorderRadius.circular(8),
      gapPadding: 10);

  static InputBorder focusBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
      borderRadius: BorderRadius.circular(8),
      gapPadding: 10);

  static InputBorder errorBorder = OutlineInputBorder(
    
      borderSide:  BorderSide(color: AppColors.errorColor, width: 1),
      borderRadius: BorderRadius.circular(8),
      gapPadding: 10);

   static TextStyle  labelStyle = GoogleFonts.poppins(
     fontSize: 18.sp,
    color: AppColors.primaryColor,
   );   
   static TextStyle  errorStyle = GoogleFonts.poppins(
     fontSize: 18.sp,
    color: AppColors.errorColor,
   );   

  //! buttons
  // ELEVATED-BUTTON
  static ButtonStyle buildElevatedButtonStyle(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor, // Background color
      foregroundColor: Colors.white, // Text color
      elevation: 5, // Elevation (shadow)
      enableFeedback: true,
      enabledMouseCursor: MouseCursor.defer,
      minimumSize: Size(size.width, size.height * 0.06),
      // maximumSize: Size(size.width * 0.4, size.height * 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6), // Button border radius
      ),
    );
  }
  static ButtonStyle primaryButtonStyle(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor, // Background color
      foregroundColor: Colors.white, // Text color
      elevation: 5, // Elevation (shadow)
      enableFeedback: true,
      enabledMouseCursor: MouseCursor.defer,
      minimumSize: Size(size.width, size.height * 0.06),
      // maximumSize: Size(size.width * 0.4, size.height * 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6), // Button border radius
      ),
    );
  }

   static ButtonStyle rejectButtonStyle(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.redColor, // Background color
      foregroundColor: Colors.white, // Text color
      elevation: 5, // Elevation (shadow)
      enableFeedback: true,
      enabledMouseCursor: MouseCursor.defer,
      minimumSize: Size(size.width, size.height * 0.06),
      // maximumSize: Size(size.width * 0.4, size.height * 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6), // Button border radius
      ),
    );
  }

   static ButtonStyle approveButtonStyle(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 32, 209, 1), // Background color
      foregroundColor: Colors.white, // Text color
      elevation: 2, // Elevation (shadow)
      enableFeedback: true,
      enabledMouseCursor: MouseCursor.defer,
      minimumSize: Size(size.width, size.height * 0.06),
      // maximumSize: Size(size.width * 0.4, size.height * 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6), // Button border radius
      ),
    );
  }

  // TEXT-BUTTON
  static ButtonStyle buildTextButtonStyle(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextButton.styleFrom(
      animationDuration: const Duration(milliseconds: 600),
      textStyle: const TextStyle(color: Colors.black),
      backgroundColor: Colors.transparent, // Background color
      foregroundColor: Colors.black, // Text color
      elevation: 5, // Elevation (shadow)
      enableFeedback: true,

      enabledMouseCursor: MouseCursor.defer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Button border radius
      ),
    );
  }

  // OUTLINED-BUTTON
  static ButtonStyle buildOutlinedButtonStyle(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextButton.styleFrom(
      animationDuration: const Duration(milliseconds: 600),
      minimumSize: Size(size.width * 0.6, size.height * 0.08),

      textStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      backgroundColor: Colors.transparent, // Background color
      // foregroundColor: Colors.black,
      // Text color
      elevation: 5, // Elevation (shadow)
      enableFeedback: true,

      enabledMouseCursor: MouseCursor.defer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6), // Button border radius
      ),
    );
  }

  
  static OutlineInputBorder defaultOutlineInputBorder() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(4)
    
  );
}
