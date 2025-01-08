part of 'login_bloc.dart';

class LoginStates extends Equatable {
  const LoginStates({
    this.email = '',
    this.password = '',
   required this.loginApi ,
  });

  final String email;
  final String password;
  final ApiResponse<String> loginApi;

  LoginStates copyWith({
    String? email,
    String? password,
    ApiResponse<String>? loginApi
  }) {
    return LoginStates(
        email: email ?? this.email,
        password: password ?? this.password,
        loginApi: loginApi ?? this.loginApi);
  }

  @override
  List<Object> get props => [email, password, loginApi];
}
