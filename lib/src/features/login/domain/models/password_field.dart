import 'package:dartz/dartz.dart';

import '../../../../core/model/Value Object/value_object.dart';
import '../../../../core/model/value failure/value_failure.dart';
class PasswordField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PasswordField(String input) {
    return PasswordField._(
      Validators.validateStringNotEmpty(input)
       );
  }

   PasswordField._(this.value);
}


