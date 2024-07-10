import 'package:dartz/dartz.dart';

import '../../../../../core/model/Value Object/Value Object.dart';
import '../../../../../core/model/value failure/value_failure.dart';

class CustomerCreateLocalityField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerCreateLocalityField(String input) {
    return CustomerCreateLocalityField._(
      Validators.validateStringNotEmpty(input).flatMap((a) => Validators.validateStringMinLength(input: input, minLength: 4))
       );
  }

   CustomerCreateLocalityField._(this.value);
}


