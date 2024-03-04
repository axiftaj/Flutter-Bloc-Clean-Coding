import 'package:formz/formz.dart';

enum FirstTextInputValidationError { invalid }

class TextInput extends FormzInput<String, FirstTextInputValidationError> {
  const TextInput.pure() : super.pure('');
  const TextInput.dirty([super.value = '']) : super.dirty();

  static final RegExp _firstTextInputRegExp = RegExp(
    r'/^(?!\s*$).+/',
  );

  @override
  FirstTextInputValidationError? validator(String? value) {
    return value!.isEmpty
        ? FirstTextInputValidationError.invalid
        : !_firstTextInputRegExp.hasMatch(value)
            ? null
            : FirstTextInputValidationError.invalid;
  }
}
