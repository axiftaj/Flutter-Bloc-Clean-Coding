import 'package:formz/formz.dart'; // Importing FormzInput from the formz package

/// Enum representing possible validation errors for email input.
enum EmailValidationError { invalid }

/// Class representing an email input for form validation.
class Email extends FormzInput<String, EmailValidationError> {
  /// Constructor for creating a pure (untouched) email input.
  const Email.pure([super.value = '']) : super.pure();

  /// Constructor for creating a dirty (touched) email input.
  const Email.dirty([super.value = '']) : super.dirty();

  /// Regular expression pattern for validating email format.
  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  /// Validator method for email input.
  EmailValidationError? validator(String? value) {
    // Checking if the provided value matches the email format regex pattern
    return _emailRegex.hasMatch(value ?? '')
        ? null // No validation error if the value matches the pattern
        : EmailValidationError.invalid; // Validation error if the value doesn't match the pattern
  }
}
