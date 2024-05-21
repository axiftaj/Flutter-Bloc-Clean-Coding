extension EmailValidatorExtension on String {
  bool emailValidator() {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(this);
    return emailValid;
  }
}
