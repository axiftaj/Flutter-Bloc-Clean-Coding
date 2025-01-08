

import 'package:bloc_clean_coding/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_clean_coding/data/response/api_response.dart';
import 'package:bloc_clean_coding/model/user/user_model.dart';
import 'package:bloc_clean_coding/repository/auth_api/auth_api_repository.dart';
import 'package:bloc_clean_coding/services/session_manager/session_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class MockAuthenticationRepository extends Mock
    implements AuthApiRepository {}

class MockSessionController extends Mock implements SessionController {}

void main(){

  TestWidgetsFlutterBinding.ensureInitialized();

  late LoginBloc loginBloc;
  const email = 'foe@gmail.com';
  const password = '1srw@gmail.com';

  late AuthApiRepository authApiRepository;

  setUp(() {
    authApiRepository = MockAuthenticationRepository();
    loginBloc =  LoginBloc(authApiRepository: authApiRepository);
  });

  group('LoginBloc', (){
    test('initial state is LoginState', () {
      final loginBloc = LoginBloc(
        authApiRepository: authApiRepository,
      );

      expect(loginBloc.state, const LoginStates());
    });


    blocTest<LoginBloc, LoginStates>(
      'emits updated email when EmailChanged event is added',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const EmailChanged(email: email)),
      expect: () => [
        const LoginStates(email: email),
      ],
    );


    blocTest<LoginBloc, LoginStates>(
      'emits updated password when PasswordChanged event is added',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const PasswordChanged(password: password)),
      expect: () => [
        const LoginStates(password: password),
      ],
    );

    blocTest<LoginBloc, LoginStates>(
      'emits loading and completed states when LoginApi event is added and login is successful',
      setUp: () {
        Map<String, String> data = {
          'email': email,
          'password':password,
        };
        when(() => authApiRepository.loginApi(data))
            .thenAnswer((_) async => UserModel(token: '1jxls2'));


      },
      build: () => LoginBloc(
        authApiRepository: authApiRepository,
      ),
      act: (bloc) {
        bloc.add(const EmailChanged(email: email));
        bloc.add(const PasswordChanged(password: password));
        bloc.add(const LoginApi());
      },
      expect: () =>  const <LoginStates>[
         LoginStates(email: email),
        LoginStates(password: password),
         LoginStates(
            email: email,
            password: password,
            loginApi: ApiResponse.loading()),
         LoginStates(
            email: email,
            password: password,
            loginApi: ApiResponse<String>.completed('Login successful')),
      ],
    );
  });
}