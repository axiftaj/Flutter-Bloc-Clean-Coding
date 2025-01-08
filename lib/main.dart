// Importing necessary packages and files

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Localization support
import 'package:flutter_localizations/flutter_localizations.dart';
import 'configs/routes/routes.dart'; // Custom routes
import 'configs/routes/routes_name.dart'; // Route names
import 'configs/themes/dark_theme.dart'; // Dark theme configuration
import 'configs/themes/light_theme.dart';
import 'dependency_injection/locator.dart'; // Light theme configuration

ServiceLocator dependencyInjector = ServiceLocator();

void main() {

  WidgetsFlutterBinding.ensureInitialized(); // Ensuring that Flutter bindings are initialized
  dependencyInjector.servicesLocator(); // Initializing service locator for dependency injection

  runApp(const MyApp()); // Running the application
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Constructor for MyApp widget

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Material app configuration
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark, // Setting theme mode to dark
      theme: lightTheme, // Setting light theme
      darkTheme: darkTheme, // Setting dark theme
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English locale
        Locale('es'), // Spanish locale
      ],
      initialRoute: RoutesName.splash, // Initial route
      onGenerateRoute: Routes.generateRoute, // Generating routes
    );
  }
}


