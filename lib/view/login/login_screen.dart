import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/login_bloc/login_bloc.dart';


import '../../dependency_injection/locator.dart';
import 'widget/widgets.dart'; // Importing custom widget components

/// A widget representing the login screen of the application.
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// The state of the [LoginScreen] widget.
class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBlocs;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBlocs = LoginBloc(authApiRepository: getIt());
  }

  @override
  void dispose() {
    _loginBlocs.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('builddd');
    return Scaffold(
      body: BlocProvider(
        create: (_) => _loginBlocs,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const EmailInputWidget(), // Widget for email input field
                const PasswordInputWidget(),
                const SizedBox(height: 20,),// Widget for password input field
                SubmitButton(
                  formKey: _formKey,
                ), // Widget for submit button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
