import 'package:intl/intl.dart';

extension DateFormatConversion on String {
  // Method to convert date string from "dd-MM-yyyy" to "yyyy-MM-dd"
  String toFormattedDate() {
    // Define the format of the input date string
    DateFormat originalFormat = DateFormat("dd-MM-yyyy");
    
    // Define the format of the output date string
    DateFormat newFormat = DateFormat("yyyy-MM-dd");

    try {
      // Parse the original date string
      DateTime dateTime = originalFormat.parse(this);
      
      // Convert the DateTime object to the new format string
      return newFormat.format(dateTime);
    } catch (e) {
      // Handle any errors that might occur during parsing or formatting
      return 'Invalid date';
    }
  }
}