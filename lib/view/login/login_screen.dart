import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../bloc/login_bloc/login_bloc.dart';
import '../../configs/routes/routes_name.dart';
import 'widget/widgets.dart'; // Importing custom widget components
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Importing app localizations for translated text

/// A widget representing the login screen of the application.
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// The state of the [LoginScreen] widget.
class _LoginScreenState extends State<LoginScreen> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<LoginBloc>().add(EmailUnfocused());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<LoginBloc>().add(PasswordUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginStates>(
        listener: (context, state) {
          if (state.status.isSuccess) {
            Navigator.pushNamed(context, RoutesName.home); // Navigating to the home screen on successful login
          }
          if (state.status.isInProgress) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(AppLocalizations.of(context)!.submitting), // Displaying submitting message
                ),
              );
          }
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage.toString()), // Displaying error message if login fails
                ),
              );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              EmailInput(focusNode: _emailFocusNode), // Widget for email input field
              PasswordInput(focusNode: _passwordFocusNode), // Widget for password input field
              const SubmitButton(), // Widget for submit button
            ],
          ),
        ),
      ),
    );
  }
}
