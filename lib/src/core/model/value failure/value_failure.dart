import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;

  const factory ValueFailure.zero({required T failedValue}) = Zero<T>;

  const factory ValueFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    required T failedValue,
  }) = ShortPassword<T>;

  const factory ValueFailure.invalidPassword({
    required T failedValue,
  }) = InvalidPassword<T>;

  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;

  const factory ValueFailure.tooShort({
    required T failedValue,
    required int min,
  }) = TooShort<T>;

  

  const factory ValueFailure.multiline({
    required T failedValue,
  }) = Multiline<T>;

  const factory ValueFailure.listTooLong({
    required T failedValue,
    required int max,
  }) = ListTooLong<T>;

  const factory ValueFailure.invalidFormat({
    required T failedValue,
  }) = InvalidFormat<T>;

  const factory ValueFailure.invalidPhoneNumber({
    required T failedValue,
  }) = InvalidPhoneNumber<T>;

  const factory ValueFailure.invalidPincode({
    required T failedValue,
  }) = InvalidPincode<T>;

  const factory ValueFailure.missingRequiredField({
    required T failedValue,
  }) = MissingRequiredField<T>;

  // Add more specific failures as needed for your form validation

  //! DATE VALIDATIONS
  const factory ValueFailure.invalidDate({
    required T failedValue,
  }) = InvalidDate<T>;

  const factory ValueFailure.dateTooEarly({
    required T failedValue,
    required DateTime earliestDate,
  }) = DateTooEarly<T>;

  const factory ValueFailure.dateTooLate({
    required T failedValue,
    required DateTime latestDate,
  }) = DateTooLate<T>;

  
}
