part of 'login_bloc.dart';



abstract class LoginEvents extends Equatable {
  const LoginEvents();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvents {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends LoginEvents {}

class PasswordChanged extends LoginEvents {

  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class PasswordUnfocused extends LoginEvents {}

class FormSubmitted extends LoginEvents {}

