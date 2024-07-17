import 'package:dartz/dartz.dart';

import '../../../../../core/model/Value Object/Value Object.dart';
import '../../../../../core/model/value failure/value_failure.dart';

class CustomerCreateCreditLimitField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerCreateCreditLimitField(String input) {
    return CustomerCreateCreditLimitField._(
      Validators.validateStringNotEmpty(input)
       );
  }

   CustomerCreateCreditLimitField._(this.value);
}


