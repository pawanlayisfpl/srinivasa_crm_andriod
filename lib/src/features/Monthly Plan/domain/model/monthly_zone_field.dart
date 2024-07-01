import '../../../../core/model/model.dart';

import 'package:dartz/dartz.dart';
class MonthlyZoneField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MonthlyZoneField(String input) {
    return MonthlyZoneField._(
      Validators.validateStringNotEmpty(input)
       );
  }

   MonthlyZoneField._(this.value);
}


