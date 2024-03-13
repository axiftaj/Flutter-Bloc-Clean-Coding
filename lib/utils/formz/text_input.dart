import 'package:formz/formz.dart'; // Importing FormzInput from the formz package

/// Enum representing possible validation errors for the first text input.
enum FirstTextInputValidationError { invalid }

/// Class representing a text input for form validation.
class TextInput extends FormzInput<String, FirstTextInputValidationError> {
  /// Constructor for creating a pure (untouched) text input.
  const TextInput.pure() : super.pure('');

  /// Constructor for creating a dirty (touched) text input.
  const TextInput.dirty([super.value = '']) : super.dirty();

  /// Regular expression pattern for validating the text input format.
  static final RegExp _firstTextInputRegExp = RegExp(
    r'^(?!\s*$).+', // Regex pattern to ensure the input is not empty or contains only whitespace
  );

  @override
  /// Validator method for the text input.
  FirstTextInputValidationError? validator(String? value) {
    // Checking if the provided value is empty or contains only whitespace
    if (value!.isEmpty) {
      return FirstTextInputValidationError.invalid; // Validation error if the value is empty
    } else {
      // Checking if the value matches the regex pattern
      return !_firstTextInputRegExp.hasMatch(value)
          ? null // No validation error if the value matches the pattern
          : FirstTextInputValidationError.invalid; // Validation error if the value doesn't match the pattern
    }
  }
}
