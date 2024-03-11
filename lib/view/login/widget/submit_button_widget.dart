import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../bloc/login_bloc/login_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);
    return ElevatedButton(
      onPressed:
          isValid ? () => context.read<LoginBloc>().add(FormSubmitted()) : null,
      child: Text(
        AppLocalizations.of(context)!.submit,
      ),
    );
  }
}
