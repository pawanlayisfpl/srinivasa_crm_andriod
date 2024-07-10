import 'package:dartz/dartz.dart';

import '../../../../../core/model/Value Object/Value Object.dart';
import '../../../../../core/model/value failure/value_failure.dart';

class CustomerCreateCityField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerCreateCityField(String input) {
    return CustomerCreateCityField._(
      Validators.validateStringNotEmpty(input).flatMap((a) => Validators.validateStringMinLength(input: input, minLength: 4))
       );
  }

   CustomerCreateCityField._(this.value);
}


