// ignore_for_file: prefer_const_constructors

import 'package:bloc_clean_coding/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_clean_coding/data/response/api_response.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  const email = 'test@khan.com' ;
  const password = '123456@12A' ;

  group('LoginStates', () {
    test('has default values', () {
      const loginState = LoginStates();
      expect(loginState.email, '');
      expect(loginState.password, '');
      expect(loginState.loginApi, null);
    });

    test('supports value comparisons', () {
      const state1 = LoginStates(email: email, password: password);
      const state2 = LoginStates(email: email, password: password);

      expect(state1, equals(state2));
    });

    test('copyWith creates a new instance with updated values', () {
      final loginState = LoginStates(email: email, password: password );
      final updatedState = loginState.copyWith(email: 'new_email', password: 'new_password');

      expect(updatedState.email, 'new_email');
      expect(updatedState.password, 'new_password');
    });

    test('copyWith retains old values when no new values are provided', () {
      const loginState = LoginStates(email: 'test@khan.com', password: '123456');
      final updatedState = loginState.copyWith();

      expect(updatedState.email, loginState.email);
      expect(updatedState.password, loginState.password);
      expect(updatedState.loginApi, loginState.loginApi);
    });

    test('loginApi supports copyWith updates', () {

      var loginApiResponse = ApiResponse.completed('');
      var loginState = LoginStates(loginApi: loginApiResponse);
      final updatedApiResponse =ApiResponse.completed('Api Changes');
      final updatedState = loginState.copyWith(loginApi: updatedApiResponse);

      expect(updatedState.loginApi, updatedApiResponse);

    });
  });

}

