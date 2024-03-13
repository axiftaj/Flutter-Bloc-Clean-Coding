import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Importing app localizations for translated text
import '../../../bloc/login_bloc/login_bloc.dart';

/// A widget representing the submit button for the login form.
class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isValid =
        context.select((LoginBloc bloc) => bloc.state.isValid); // Checking if the login form is valid
    return ElevatedButton(
      onPressed: isValid
          ? () => context.read<LoginBloc>().add(FormSubmitted()) // Dispatching FormSubmitted event if the form is valid
          : null,
      child: Text(
        AppLocalizations.of(context)!.submit, // Localized text for the submit button
      ),
    );
  }
}
