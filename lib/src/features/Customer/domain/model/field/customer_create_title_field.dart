import 'package:dartz/dartz.dart';

import '../../../../../core/model/Value Object/Value Object.dart';
import '../../../../../core/model/value failure/value_failure.dart';

class CustomreCreateTitleField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomreCreateTitleField(String input) {
    return CustomreCreateTitleField._(
      Validators.validateStringNotEmpty(input).flatMap((a) => Validators.validateEmailAddress(input))
       );
  }

   CustomreCreateTitleField._(this.value);
}


