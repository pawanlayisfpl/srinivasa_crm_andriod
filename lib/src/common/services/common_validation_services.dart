
import '../../core/model/validation_mode.dart';

class ValidationServices {
  static ValidationModel validateNotEmpty(String value, String fieldName) {
    if (value.isEmpty) {
      return ValidationModel(error: "$fieldName cannot be empty");
    }

    return ValidationModel(value: value);
  }

  static ValidationModel validateEmail(String email) {
    if (email.isEmpty) {
      return ValidationModel(error: "Email cannot be empty");
    }

    // Add email validation logic if needed

    return ValidationModel(value: email);
  }

  static ValidationModel validatePhone(String phone) {
    if (phone.isEmpty) {
      return ValidationModel(error: "Phone number cannot be empty");
    }

    // Add more phone number validation logic if needed

    return ValidationModel(value: phone);
  }

  static ValidationModel validatePassword(String password) {
    // Add password validation logic if needed

    return ValidationModel(value: password);
  }

  static ValidationModel validateDOB(DateTime dob) {
    // Add Date of Birth validation logic if needed

    return ValidationModel(value: dob.toLocal().toString().split(' ')[0]);
  }
}
