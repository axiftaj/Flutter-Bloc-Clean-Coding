import 'package:flutter/material.dart';
import '../../../configs/routes/routes_name.dart';
import '../../../services/storage/local_storage.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
        onTap: (){
          LocalStorage localStorage =  LocalStorage();
          localStorage.clearValue('token').then((value){
            localStorage.clearValue('isLogin');
            Navigator.pushNamed(context, RoutesName.login);
          });
        },
        child: const Center(child: Text('Logout')));

  }
}
