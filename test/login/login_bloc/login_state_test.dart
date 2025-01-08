// ignore_for_file: prefer_const_constructors

import 'package:bloc_clean_coding/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_clean_coding/data/response/api_response.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  const email = 'axiftaj@gmail.com';
  const password = '12@kl4Abc*';
  final apiStatus = ApiResponse.completed('');


  group('LoginState', () {
    test('supports value comparisons', () {
      expect(LoginStates(loginApi: apiStatus), LoginStates(loginApi: apiStatus));
    });

    test('returns same object when no properties are passed', () {
      expect(LoginStates(loginApi: apiStatus).copyWith(), LoginStates(loginApi: apiStatus));
    });


    test('returns object with updated username when username is passed', () {
      expect(
        LoginStates(loginApi: apiStatus).copyWith(email: email),
        LoginStates(email: email, loginApi: apiStatus),
      );
    });

    test('returns object with updated api response is updated', () {
      expect(
        LoginStates(loginApi: apiStatus).copyWith(loginApi: apiStatus),
        LoginStates(loginApi: apiStatus),
      );
    });

    test('returns object with updated password when password is passed', () {
      expect(
        LoginStates(loginApi: apiStatus).copyWith(password: password),
        LoginStates(password: password, loginApi: apiStatus),
      );
    });
  });
}