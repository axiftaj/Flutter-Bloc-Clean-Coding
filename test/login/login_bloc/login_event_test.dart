
import 'package:bloc_clean_coding/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String email = 'test@khan.com';
  String password = 'mock-password';
  group('LoginEvent', () {
    group('EmailChange', () {
      test('supports value comparisons', () {
        expect(EmailChanged( email: email), EmailChanged(email: email));
      });
    });

    group('PasswordChanged', () {
      test('supports value comparisons', () {
        expect(PasswordChanged( password: password), PasswordChanged(password: password));
      });
    });

    group('LoginApi', () {
      test('supports value comparisons', () {
        expect(LoginApi(), LoginApi());
      });
    });
  });
}