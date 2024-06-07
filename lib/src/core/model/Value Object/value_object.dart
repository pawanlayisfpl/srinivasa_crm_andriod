import 'package:dartz/dartz.dart';

import '../value failure/value_failure.dart';

// Abstract ValueObject class to enforce validation of values.
// This class is used to ensure that the values we work with meet certain conditions.
abstract class ValueObject<T> {
  // `value` is an Either type that can hold a ValueFailure or a valid value.
  // It's used to represent the state of the value after validation.
  Either<ValueFailure<T>, T> get value;

  // You can add shared methods or properties here if needed.
}

// Validators class containing all the validation methods.
// This class is used to validate different types of input.
class Validators {
  // Validates that the string is not empty.
  // This method checks if the input string is not empty and returns an Either type.
  static Either<ValueFailure<String>, String> validateStringNotEmpty(
      String input) {
    return input.isNotEmpty
        ? right(input)
        : left(ValueFailure.empty(failedValue: input));
  }

   static Either<ValueFailure<String>, String> validateNotZeroValue(
      String input) {
    return input != "0"
        ? right(input)
        : left(ValueFailure.zero(failedValue: input));
  }

  static Either<ValueFailure<String>, String> validateStringMinLength(
      {required String input, required int minLength}) {
    return input.length >= minLength
        ? right(input)
        : left(ValueFailure.zero(failedValue: input));
  }

  static Either<ValueFailure<String>,String> validatePhoneNumber(String input){
    RegExp phoneRegExp = RegExp(
      r'^[0-9]{10}$',
    );
    return phoneRegExp.hasMatch(input)
        ? right(input)
        : left(ValueFailure.invalidPhoneNumber(failedValue: input));
  }

  // create same for pincode
  static Either<ValueFailure<String>,String> validatePincode(String input){
    RegExp phoneRegExp = RegExp(
      r'^[0-9]{6}$',
    );
    return phoneRegExp.hasMatch(input)
        ? right(input)
        : left(ValueFailure.invalidPincode(failedValue: input));
  }

  static Either<ValueFailure<int>,int> validateNotEqualsToZero(int input){
    return input != 0
        ? right(input)
        : left(ValueFailure.zero(failedValue: input));
  }

  // Validates the email address using a regular expression.
  // This method checks if the input string is a valid email address and returns an Either type.
  static Either<ValueFailure<String>, String> validateEmailAddress(
      String input) {
    RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    return emailRegExp.hasMatch(input)
        ? right(input)
        : left(ValueFailure.invalidEmail(failedValue: input));
  }

  // Validates the password length.
  // This method checks if the input string is a valid password (length >= 6) and returns an Either type.
  static Either<ValueFailure<String>, String> validatePassword(String input) {
    return input.length >= 6
        ? right(input)
        : left(ValueFailure.shortPassword(failedValue: input));
  }

  //! DATE VALIDATIONS
  // Validates that the date is not null.
  static Either<ValueFailure<DateTime?>, DateTime?> validateDateNotNull(
      DateTime? input) {
    return input != null
        ? right(input)
        : left(ValueFailure.invalidDate(failedValue: input));
  }

  // Validates that the date is not before today's date.
  static Either<ValueFailure<DateTime>, DateTime> validateDateNotBeforeToday(
      DateTime input) {
    var today = DateTime.now();
    return input.isAfter(today) || input.isAtSameMomentAs(today)
        ? right(input)
        : left(
            ValueFailure.dateTooEarly(failedValue: input, earliestDate: today));
  }
}
