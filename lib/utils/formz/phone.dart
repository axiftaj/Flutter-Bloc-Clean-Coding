import 'package:formz/formz.dart'; // Importing FormzInput from the formz package

/// Enum representing possible validation errors for the phone input.
enum PhoneValidationError { invalid }

/// Class representing a phone input for form validation.
class Phone extends FormzInput<String, PhoneValidationError> {
  /// Constructor for creating a pure (untouched) phone input.
  const Phone.pure() : super.pure('');

  /// Constructor for creating a dirty (touched) phone input.
  const Phone.dirty([super.value = '']) : super.dirty();

  /// Regular expression pattern for validating phone format.
  static final RegExp _phoneRegExp = RegExp(
    r'(^(?:[+0]9)?[0-9]{10,12}$)', // Regex pattern to validate phone number format
  );

  @override
  /// Validator method for the phone input.
  PhoneValidationError? validator(String? value) {
    // Checking if the provided value matches the phone format regex pattern
    return _phoneRegExp.hasMatch(value!)
        ? null // No validation error if the value matches the pattern
        : PhoneValidationError.invalid; // Validation error if the value doesn't match the pattern
  }
}
