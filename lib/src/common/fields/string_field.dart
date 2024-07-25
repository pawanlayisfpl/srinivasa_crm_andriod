import 'package:dartz/dartz.dart';

import '../../core/model/model.dart';


class StringField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StringField(String input) {
    return StringField._(
      Validators.validateStringNotEmpty(input).flatMap((a) => Validators.validateStringMinLength(input: input, minLength: 4))
       );
  }

   StringField._(this.value);
}


