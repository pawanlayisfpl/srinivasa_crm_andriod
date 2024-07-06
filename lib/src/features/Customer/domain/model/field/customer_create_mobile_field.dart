import 'package:dartz/dartz.dart';

import '../../../../../core/model/Value Object/Value Object.dart';
import '../../../../../core/model/value failure/value_failure.dart';

class CustomerCreateMobileField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerCreateMobileField(String input) {
    return CustomerCreateMobileField._(
      Validators.validateStringNotEmpty(input).flatMap((a) => Validators.validateEmailAddress(input))
       );
  }

   CustomerCreateMobileField._(this.value);
}


