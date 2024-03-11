import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/login_bloc/login_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.email.value,
          focusNode: focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.email),
            labelText: AppLocalizations.of(context)!.email,
            helperText: AppLocalizations.of(context)!
                .aCompleteValidEmailExamplejoegmailcom,
            errorText: state.email.displayError != null
                ? AppLocalizations.of(context)!
                    .pleaseEnsureTheEmailEnteredIsValid
                : null,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
