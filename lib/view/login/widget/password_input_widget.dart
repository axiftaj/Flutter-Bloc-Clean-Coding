import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Importing app localizations for translated text

import '../../../bloc/login_bloc/login_bloc.dart';

/// A widget representing the password input field.

class PasswordInputWidget extends StatefulWidget {
  const PasswordInputWidget({super.key});

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {

  final FocusNode focusNode = FocusNode();
  final TextEditingController  passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          focusNode: focusNode, // Setting focus node
          decoration: InputDecoration(
            icon: const Icon(Icons.lock), // Icon for password input field
            helperText: AppLocalizations.of(context)!.passwordShouldbeatleast_characterswithatleastoneletterandnumber, // Helper text for password input field
            helperMaxLines: 2, // Maximum lines for helper text
            labelText: AppLocalizations.of(context)!.password, // Label text for password input field
            errorMaxLines: 2, // Maximum lines for error text
          ),
          obscureText: true, // Making the text input obscure (i.e., showing dots instead of actual characters)
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter password';
            }
            if (value.length < 6) {
              return 'please enter password greater than 6 char';
            }
            return null;
          },
          onChanged: (value) {
            // Dispatching PasswordChanged event when password input changes
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}

