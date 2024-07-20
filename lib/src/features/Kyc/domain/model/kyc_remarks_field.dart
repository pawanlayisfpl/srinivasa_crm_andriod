import 'package:dartz/dartz.dart';

import '../../../../core/model/Value Object/value_object.dart';
import '../../../../core/model/value failure/value_failure.dart';
class KycRemarksField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory KycRemarksField(String input) {
    return KycRemarksField._(
      Validators.validateStringNotEmpty(input),
       );
  }

   KycRemarksField._(this.value);
}


