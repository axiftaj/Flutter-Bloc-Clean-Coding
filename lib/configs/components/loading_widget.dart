import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//custom loading widget, we will used this widget show user some action depending on it's need
// this widget is generic, we can change it and this change will appear across the app
class LoadingWidget extends StatelessWidget {
  final double size;
  const LoadingWidget({Key? key, this.size = 36.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Platform.isIOS
            ? const CupertinoActivityIndicator(
          color: Colors.blue,
        )
            : const CircularProgressIndicator(
          strokeWidth: 2.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}
