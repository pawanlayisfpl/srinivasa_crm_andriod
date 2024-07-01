import '../../../../core/model/model.dart';

import 'package:dartz/dartz.dart';
class MonthlyPlanCustomerField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MonthlyPlanCustomerField(String input) {
    return MonthlyPlanCustomerField._(
      Validators.validateStringNotEmpty(input)
       );
  }

   MonthlyPlanCustomerField._(this.value);
}


