import 'package:flutter/material.dart';

import 'themes.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
        toolbarTextStyle: ThemeData.light().textTheme.headline2!.copyWith(
            fontFamily: ThemeConfig.pangramRegular,
            color: Colors.white,
            fontWeight: FontWeight.w500),
        iconTheme: const IconThemeData(
          color: Colors.white,
        )),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    backgroundColor: const Color(0xff202934),
    textTheme: ThemeData.dark().textTheme.copyWith(
          subtitle1: ThemeData.dark().textTheme.subtitle1!.copyWith(
              fontFamily: ThemeConfig.pangramRegular, color: Colors.white),
          subtitle2: ThemeData.dark().textTheme.subtitle2!.copyWith(
              fontFamily: ThemeConfig.pangramRegular,
              color: Colors.white.withOpacity(.5)),
          headline1: const TextStyle(
            color: Colors.white,
          ),
          headline2: const TextStyle(
              fontFamily: ThemeConfig.pangramRegular,
              color: Colors.white,
              fontWeight: FontWeight.w400),

      headline4: ThemeData.dark().textTheme.bodyText2!.copyWith(
          fontFamily: ThemeConfig.pangramMedium ,
          color: ThemeConfig.textColor6B698E ),

          headline3: ThemeData.light()
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        bodyText2: ThemeData.dark().textTheme.bodyText2!.copyWith(
            fontFamily: ThemeConfig.pangramLight ,
            color: ThemeConfig.textColorBCBFC2 ),
        ),

    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith(
          (states) => Colors.white.withOpacity(.3)),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
        secondary: const Color(0xff73777a),
        primary: Colors.white,
        onPrimary: const Color(0xffA0A0A0),
        outline: Colors.black,
        onBackground: const Color(0xff202934),
        brightness: Brightness.dark,
        background: const Color(0xff202934),
        primaryContainer: const Color(0xff2d3236),
        onPrimaryContainer: const Color(0xff5a5f62)),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        linearTrackColor: Colors.white, color: ThemeConfig.primaryColor),
    primaryColor: ThemeConfig.primaryColor,
    scaffoldBackgroundColor: ThemeConfig.darkBackColor);
