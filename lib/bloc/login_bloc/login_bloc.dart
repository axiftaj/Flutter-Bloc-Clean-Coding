import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import '../../repository/auth_api/auth_api_repository.dart';
import '../../services/session_manager/session_controller.dart';
import '../../utils/formz/email.dart';
import '../../utils/formz/password.dart';
part 'login_events.dart';
part 'login_states.dart';



class LoginBloc extends Bloc<LoginEvents, LoginStates> {

  AuthApiRepository authApiRepository  ;
  LoginBloc({required this.authApiRepository}) : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<EmailUnfocused>(_onEmailUnfocused);
    on<PasswordUnfocused>(_onPasswordUnfocused);
    on<FormSubmitted>(_onFormSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email.isValid ? email : Email.pure(event.email),
        isValid: Formz.validate([email, state.password]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password.isValid ? password : Password.pure(event.password),
        isValid: password.value.length < 6 ? false : true,
       // isValid: Formz.validate([state.email, password]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onEmailUnfocused(EmailUnfocused event, Emitter<LoginStates> emit) {
    final email = Email.dirty(state.email.value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onPasswordUnfocused(
      PasswordUnfocused event,
      Emitter<LoginStates> emit,
      ) {
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> _onFormSubmitted(
      FormSubmitted event,
      Emitter<LoginStates> emit,
      ) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        email: email,
        password: password,
        isValid: Formz.validate([email, password]),
        status: FormzSubmissionStatus.initial,
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      Map<String, String> data ={
        'email' : email.value.toString(),
        'password' : 'cityslicka',
      };
     await authApiRepository.loginApi(data).then((value) async {
        if(value.error.isNotEmpty){
          emit(state.copyWith(status: FormzSubmissionStatus.failure  , errorMessage: value.error));
        }else {
          await SessionController().saveUserInPreference(value);
          await SessionController().getUserFromPreference();
          emit(state.copyWith(status: FormzSubmissionStatus.success));
        }
      }).onError((error, stackTrace){
        emit(state.copyWith(status: FormzSubmissionStatus.failure  , errorMessage: error.toString()));
      });
    }
  }
}