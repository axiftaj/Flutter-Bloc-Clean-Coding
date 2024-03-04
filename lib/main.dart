import 'package:bloc_clean_coding/bloc/movies_bloc/movies_bloc.dart';
import 'package:bloc_clean_coding/repository/auth_api/auth_api_repository.dart';
import 'package:bloc_clean_coding/repository/auth_api/auth_http_api_repository.dart';
import 'package:bloc_clean_coding/repository/home_api/home_api_repository.dart';
import 'package:bloc_clean_coding/repository/home_api/home_http_api_repository.dart';
import 'package:bloc_clean_coding/view/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'bloc/app_bloc_observer.dart';
import 'bloc/login_bloc/login_bloc.dart';
import 'configs/routes/routes.dart';
import 'configs/routes/routes_name.dart';

// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton<AuthApiRepository>(() => AuthHttpApiRepository());
  getIt.registerLazySingleton<HomeApiRepository>(() => HomeHttpApiRepository());

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
        BlocProvider(create: (_) => MoviesBloc(homeRepository: getIt())),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      //  home: const SplashView(),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
