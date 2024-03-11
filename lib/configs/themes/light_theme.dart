import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'themes.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        toolbarTextStyle: ThemeData.light().textTheme.headline2!.copyWith(
            fontFamily: ThemeConfig.pangramRegular,
            color: Colors.black,
            fontWeight: FontWeight.w500),
        iconTheme: const IconThemeData(
          color: Colors.black,
        )),

    colorScheme: ThemeData.light().colorScheme.copyWith(
        secondary: const Color(0xffa1a1a1),
        primary: const Color(0xff0F0425),
        onPrimary: const Color(0xff9694B8),
        outline: const Color(0xfff0f0f0),
        onBackground: const Color(0xfff6f8f8),
        background: const Color(0xffDCE8E8),
        primaryContainer: Colors.white,
        onPrimaryContainer: const Color(0xffd8d8da)),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: const Color(0xffF6F8F8),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        linearTrackColor: Color(0xffECEAEA), color: ThemeConfig.primaryColor),
    primaryColor: ThemeConfig.primaryColor,
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) => Colors.black.withOpacity(.4),
      ),
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          // titleSmall: ThemeData.light().textTheme.titleSmall!.copyWith(
          //     fontFamily: ThemeConfig.pangramRegular,
          //     color: const Color(0xff999999)),
          subtitle1: ThemeData.light().textTheme.subtitle1!.copyWith(
              fontFamily: ThemeConfig.pangramRegular,
              color: const Color(0xff151152)),
          subtitle2: ThemeData.light().textTheme.subtitle2!.copyWith(
              fontFamily: ThemeConfig.pangramRegular,
              color: const Color(0xff6B698E)),
          headline1: const TextStyle(
            fontFamily: ThemeConfig.pangramRegular,
            color: ThemeConfig.textColo151152,
          ),
          headline2: const TextStyle(
              fontFamily: ThemeConfig.pangramRegular,
              color: Colors.black,
              fontWeight: FontWeight.w400),
          headline3: ThemeData.light()
              .textTheme
              .headline3!
              .copyWith(color: const Color(0xff0F0425)),
        headline4: ThemeData.light().textTheme.bodyText2!.copyWith(fontFamily: ThemeConfig.pangramMedium ,color: ThemeConfig.textColor6B698E ),

        bodyText2: ThemeData.light().textTheme.bodyText2!.copyWith(fontFamily: ThemeConfig.pangramRegular ,color: ThemeConfig.textColor6B698E )

        ));
