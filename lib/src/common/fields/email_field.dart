import 'package:dartz/dartz.dart';

import '../../core/model/model.dart';


class EmailField extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailField(String input) {
    return EmailField._(
      Validators.validateStringNotEmpty(input).flatMap((a) => Validators.validateStringMinLength(input: input, minLength: 4))
       );
  }

   EmailField._(this.value);
}


