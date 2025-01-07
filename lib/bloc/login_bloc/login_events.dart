part of 'login_bloc.dart';

sealed class LoginEvents  {
  const LoginEvents();
}

class EmailChanged extends LoginEvents {
  final String email;
  const EmailChanged({required this.email});
}

class PasswordChanged extends LoginEvents {
  final String password;
  const PasswordChanged({required this.password});
}

class LoginApi extends LoginEvents {}
