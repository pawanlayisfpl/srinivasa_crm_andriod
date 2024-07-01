import '../../../../core/model/model.dart';

import 'package:dartz/dartz.dart';
class MonthlyPlanDateField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MonthlyPlanDateField(String input) {
    return MonthlyPlanDateField._(
      Validators.validateStringNotEmpty(input)
       );
  }

   MonthlyPlanDateField._(this.value);
}


