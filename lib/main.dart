import 'package:bloc_clean_coding/bloc/movies_bloc/movies_bloc.dart';
import 'package:bloc_clean_coding/repository/auth_api/auth_api_repository.dart';
import 'package:bloc_clean_coding/repository/auth_api/auth_http_api_repository.dart';
import 'package:bloc_clean_coding/repository/movies_api/movies_api_repository.dart';
import 'package:bloc_clean_coding/repository/movies_api/movies_http_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'bloc/login_bloc/login_bloc.dart';
import 'configs/routes/routes.dart';
import 'configs/routes/routes_name.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'configs/themes/dark_theme.dart';
import 'configs/themes/light_theme.dart';

// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  servicesLocator();
//  Bloc.observer =  AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc(authApiRepository: getIt())),
        BlocProvider(create: (_) => MoviesBloc(moviesApiRepository: getIt())),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: lightTheme,
        darkTheme: darkTheme,

        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('es'), // Spanish
        ],
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}


void servicesLocator(){
  getIt.registerLazySingleton<AuthApiRepository>(() => AuthHttpApiRepository());
  getIt.registerLazySingleton<MoviesApiRepository>(() => MoviesHttpApiRepository());
}