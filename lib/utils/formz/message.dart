import 'package:formz/formz.dart';

enum FirstMessageValidationError { invalid }

class Message extends FormzInput<String, FirstMessageValidationError> {
  const Message.pure() : super.pure('');
  const Message.dirty([super.value = '']) : super.dirty();

  static final RegExp _firstMessageRegExp = RegExp(
    r'/^(?!\s*$).+/',
  );

  @override
  FirstMessageValidationError? validator(String? value) {
    return value!.isEmpty
        ? FirstMessageValidationError.invalid
        : !_firstMessageRegExp.hasMatch(value)
            ? null
            : FirstMessageValidationError.invalid;
  }
}
