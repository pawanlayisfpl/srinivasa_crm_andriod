import 'package:dartz/dartz.dart';

import '../../../../../core/model/Value Object/Value Object.dart';
import '../../../../../core/model/value failure/value_failure.dart';

class CustomerCreateContactPersonField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerCreateContactPersonField(String input) {
    return CustomerCreateContactPersonField._(
      Validators.validateStringNotEmpty(input).flatMap((a) => Validators.validateEmailAddress(input))
       );
  }

   CustomerCreateContactPersonField._(this.value);
}


