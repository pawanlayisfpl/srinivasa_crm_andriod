import 'package:dartz/dartz.dart';

import '../../core/model/model.dart';


class NumberField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory NumberField(String input) {
    return NumberField._(
      Validators.validateNotZeroValue(input)
       );
  }

   NumberField._(this.value);
}


