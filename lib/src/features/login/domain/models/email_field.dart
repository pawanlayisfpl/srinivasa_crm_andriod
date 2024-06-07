import 'package:dartz/dartz.dart';

import '../../../../core/model/Value Object/value_object.dart';
import '../../../../core/model/value failure/value_failure.dart';
class EmailField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailField(String input) {
    return EmailField._(
      Validators.validateStringNotEmpty(input).flatMap((a) => Validators.validateEmailAddress(input))
       );
  }

   EmailField._(this.value);
}


