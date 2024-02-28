import 'package:formz/formz.dart';

enum PhoneValidationError { invalid }

class Phone extends FormzInput<String, PhoneValidationError> {
  const Phone.pure() : super.pure('');
  const Phone.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'(^(?:[+0]9)?[0-9]{10,12}$)',
  );

  @override
  PhoneValidationError? validator(String? value) {
    return _emailRegExp.hasMatch(value!) ? null : PhoneValidationError.invalid;
  }
}
