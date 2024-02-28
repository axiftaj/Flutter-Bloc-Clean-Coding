import 'package:formz/formz.dart';

enum FirstNameValidationError { invalid }

class Name extends FormzInput<String, FirstNameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([String value = '']) : super.dirty(value);

  static final RegExp _firstnameRegExp = RegExp(
    r'/^(?!\s*$).+/',
  );

  @override
  FirstNameValidationError? validator(String? value) {
    return value!.isEmpty
        ? FirstNameValidationError.invalid
        : !_firstnameRegExp.hasMatch(value)
            ? null
            : FirstNameValidationError.invalid;
  }
}