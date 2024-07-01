import 'package:dartz/dartz.dart';

import '../../../../core/model/model.dart';
class MonthlyPlanApproxKilomenterField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MonthlyPlanApproxKilomenterField(String input) {
    return MonthlyPlanApproxKilomenterField._(
      Validators.validateStringNotEmpty(input)
       );
  }

   MonthlyPlanApproxKilomenterField._(this.value);
}


