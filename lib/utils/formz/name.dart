import 'package:formz/formz.dart'; // Importing FormzInput from the formz package

/// Enum representing possible validation errors for the first name input.
enum FirstNameValidationError { invalid }

/// Class representing a name input for form validation.
class Name extends FormzInput<String, FirstNameValidationError> {
  /// Constructor for creating a pure (untouched) name input.
  const Name.pure() : super.pure('');

  /// Constructor for creating a dirty (touched) name input.
  const Name.dirty([super.value = '']) : super.dirty();

  /// Regular expression pattern for validating the first name format.
  static final RegExp _firstnameRegExp = RegExp(
    r'^(?!\s*$).+', // Regex pattern to ensure the name is not empty or contains only whitespace
  );

  @override
  /// Validator method for the first name input.
  FirstNameValidationError? validator(String? value) {
    // Checking if the provided value is empty or contains only whitespace
    if (value!.isEmpty) {
      return FirstNameValidationError.invalid; // Validation error if the value is empty
    } else {
      // Checking if the value matches the regex pattern
      return !_firstnameRegExp.hasMatch(value)
          ? null // No validation error if the value matches the pattern
          : FirstNameValidationError.invalid; // Validation error if the value doesn't match the pattern
    }
  }
}
