import 'package:dartz/dartz.dart';

import '../../../../../core/model/Value Object/Value Object.dart';
import '../../../../../core/model/value failure/value_failure.dart';

class CustomerCreatePincodeField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerCreatePincodeField(String input) {
    return CustomerCreatePincodeField._(
      Validators.validateStringNotEmpty(input).flatMap((a) => Validators.validateEmailAddress(input))
       );
  }

   CustomerCreatePincodeField._(this.value);
}


