import 'package:flutter/material.dart';
import '../../../configs/routes/routes_name.dart';
import '../../../services/storage/local_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          LocalStorage localStorage = LocalStorage();
          localStorage.clearValue('token').then((value) {
            localStorage.clearValue('isLogin');
            Navigator.pushNamed(context, RoutesName.login);
          });
        },
        child: Center(child: Text(AppLocalizations.of(context)!.logout)));
  }
}
