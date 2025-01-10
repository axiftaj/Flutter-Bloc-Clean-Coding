import 'package:bloc_clean_coding/configs/components/round_button.dart';
import 'package:bloc_clean_coding/utils/extensions/flush_bar_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc/login_bloc.dart';
import '../../../configs/routes/routes_name.dart';
import '../../../data/response/status.dart';


/// A widget representing the submit button for the login form.
class SubmitButton extends StatelessWidget {
  final formKey;
  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginStates>(
      listenWhen: (current, previous) => current.loginApi.status != previous.loginApi.status,
      listener: (context, state) {

        if (state.loginApi.status == Status.error) {
          context.flushBarErrorMessage(message: state.loginApi.message.toString());
        }

        if (state.loginApi.status == Status.completed) {
          Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false);
        }
      },
      builder: (context, state) {
        return RoundButton(
            title: 'Login',
            loading: state.loginApi.status == Status.loading ? true  :false ,
            onPress: (){
              if (formKey.currentState.validate()) {
                context.read<LoginBloc>().add(const LoginApi());
              }
            });
      },

    );
  }
}
