import 'package:dartz/dartz.dart';

import '../../../../../core/model/Value Object/Value Object.dart';
import '../../../../../core/model/value failure/value_failure.dart';

class CustomerCreateAddressLineTwoField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerCreateAddressLineTwoField(String input) {
    return CustomerCreateAddressLineTwoField._(
      Validators.validateStringNotEmpty(input)
       );
  }

   CustomerCreateAddressLineTwoField._(this.value);
}


