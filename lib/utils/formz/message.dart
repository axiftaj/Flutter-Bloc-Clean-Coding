import 'package:formz/formz.dart'; // Importing FormzInput from the formz package

/// Enum representing possible validation errors for the first message input.
enum FirstMessageValidationError { invalid }

/// Class representing a message input for form validation.
class Message extends FormzInput<String, FirstMessageValidationError> {
  /// Constructor for creating a pure (untouched) message input.
  const Message.pure() : super.pure('');

  /// Constructor for creating a dirty (touched) message input.
  const Message.dirty([super.value = '']) : super.dirty();

  /// Regular expression pattern for validating the first message format.
  static final RegExp _firstMessageRegExp = RegExp(
    r'^(?!\s*$).+', // Regex pattern to ensure the message is not empty or contains only whitespace
  );

  @override
  /// Validator method for the first message input.
  FirstMessageValidationError? validator(String? value) {
    // Checking if the provided value is empty or contains only whitespace
    if (value!.isEmpty) {
      return FirstMessageValidationError.invalid; // Validation error if the value is empty
    } else {
      // Checking if the value matches the regex pattern
      return !_firstMessageRegExp.hasMatch(value)
          ? null // No validation error if the value matches the pattern
          : FirstMessageValidationError.invalid; // Validation error if the value doesn't match the pattern
    }
  }
}
