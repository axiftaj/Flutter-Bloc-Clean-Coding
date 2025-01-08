part of 'login_bloc.dart';

class LoginStates extends Equatable {
  const LoginStates({
    this.email = '',
    this.password = '',
    this.postApiStatus = PostApiStatus.initial,
    this.message = ''});

  final String email;
  final String password;
  final String message;
  final PostApiStatus postApiStatus;

  LoginStates copyWith({String? email, String? password, String? message, PostApiStatus? postApiStatus}) {
    return LoginStates(email: email ?? this.email, password: password ?? this.password, message: message ?? this.message, postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object> get props => [email, password, postApiStatus, message];
}
