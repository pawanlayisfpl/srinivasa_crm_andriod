import 'package:dartz/dartz.dart';

import '../../core/model/model.dart';


class PhoneField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PhoneField(String input) {
    return PhoneField._(
      Validators.validatePhoneNumber(input).flatMap((a) => Validators.validateStringNotEmpty( input,))
       );
  }

   PhoneField._(this.value);
}


