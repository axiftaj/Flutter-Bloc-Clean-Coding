part of 'login_bloc.dart';


class LoginStates extends Equatable {
 const LoginStates({
  this.email = const Email.pure(),
  this.password = const Password.pure(),
  this.isValid = false,
  this.status = FormzSubmissionStatus.initial,
  this.errorMessage = ''
 });

 final Email email;
 final Password password;
 final bool isValid;
 final FormzSubmissionStatus status;
 final String errorMessage;

 LoginStates copyWith({
  Email? email,
  Password? password,
  bool? isValid,
  FormzSubmissionStatus? status,
  String? errorMessage
 }) {
  return LoginStates(
   email: email ?? this.email,
   password: password ?? this.password,
   isValid: isValid ?? this.isValid,
   status: status ?? this.status,
   errorMessage: errorMessage ?? this.errorMessage,
  );
 }

 @override
 List<Object> get props => [email, password, status , errorMessage];
}