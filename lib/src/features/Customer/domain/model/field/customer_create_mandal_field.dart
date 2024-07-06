import 'package:dartz/dartz.dart';

import '../../../../../core/model/Value Object/Value Object.dart';
import '../../../../../core/model/value failure/value_failure.dart';

class CustomerCreateMandalField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerCreateMandalField(String input) {
    return CustomerCreateMandalField._(
      Validators.validateStringNotEmpty(input).flatMap((a) => Validators.validateEmailAddress(input))
       );
  }

   CustomerCreateMandalField._(this.value);
}


