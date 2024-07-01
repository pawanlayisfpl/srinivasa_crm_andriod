import '../../../../core/model/model.dart';

import 'package:dartz/dartz.dart';
class MonthlyPlanRouteField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MonthlyPlanRouteField(String input) {
    return MonthlyPlanRouteField._(
      Validators.validateStringNotEmpty(input)
       );
  }

   MonthlyPlanRouteField._(this.value);
}


