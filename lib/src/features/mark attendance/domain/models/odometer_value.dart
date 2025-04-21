import 'package:dartz/dartz.dart';

import '../../../../core/model/Value Object/Value Object.dart';
import '../../../../core/model/value failure/value_failure.dart';
 

 
class MarketOdometerField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MarketOdometerField(String input) {
    return MarketOdometerField._(
      Validators.validateStringNotEmpty(input).flatMap((a) => Validators.validatePhoneNumber(input))
       );
  }

   MarketOdometerField._(this.value);
}