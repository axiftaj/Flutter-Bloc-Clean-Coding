import 'package:formz/formz.dart'; // Importing FormzInput from the formz package

/// Enum representing possible validation errors for the password input.
enum PasswordValidationError { invalid }

/// Class representing a password input for form validation.
class Password extends FormzInput<String, PasswordValidationError> {
  /// Constructor for creating a pure (untouched) password input.
  const Password.pure([super.value = '']) : super.pure();

  /// Constructor for creating a dirty (touched) password input.
  const Password.dirty([super.value = '']) : super.dirty();

  /// Regular expression pattern for validating password format.
  static final _passwordRegex = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  @override
  /// Validator method for the password input.
  PasswordValidationError? validator(String? value) {
    // Checking if the provided value matches the password format regex pattern
    return _passwordRegex.hasMatch(value ?? '')
        ? null // No validation error if the value matches the pattern
        : PasswordValidationError.invalid; // Validation error if the value doesn't match the pattern
  }
}
