import 'package:formz/formz.dart';

enum NameValidationError { invalid }

class Name extends FormzInput<String, NameValidationError> {
 const Name.pure() : super.pure('');
 const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String? value) {
    return value!.length > 2 ? null : NameValidationError.invalid;
  }
}
 