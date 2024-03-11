import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/login_bloc/login_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.password.value,
          focusNode: focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.lock),
            helperText:
             AppLocalizations.of(context)!.passwordShouldbeatleast_characterswithatleastoneletterandnumber,
            helperMaxLines: 2,
            labelText: AppLocalizations.of(context)!.password,
            errorMaxLines: 2,
            errorText: state.password.displayError != null
                ? AppLocalizations.of(context)!.passwordRequirements
                : null,
          ),
          obscureText: true,
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
