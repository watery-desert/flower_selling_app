import 'package:formz/formz.dart';

enum NameValidationError { empty, invalid }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    // return value!.length > 2 ? null : NameValidationError.invalid;
    if (value.isEmpty) {
      return NameValidationError.empty;
    } else if (value.length < 3) {
      return NameValidationError.invalid;
    } else {
      return null;
    }
  }

  static String showNameErrorMessage(NameValidationError? error) {
    if (error == NameValidationError.empty) {
      return 'Empty name';
    } else if (error == NameValidationError.invalid) {
      return 'Too short name';
    } else {
      return 'error';
    }
  }
}
