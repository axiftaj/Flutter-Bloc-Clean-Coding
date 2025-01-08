
import 'dependency_injection.dart';

// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;


class ServiceLocator {

  void servicesLocator() {
    getIt.registerLazySingleton<AuthApiRepository>(() => AuthMockApiRepository()); // Registering AuthHttpApiRepository as a lazy singleton for AuthApiRepository
    getIt.registerLazySingleton<MoviesApiRepository>(() => MoviesMockApiRepository()); // Registering MoviesHttpApiRepository as a lazy singleton for MoviesApiRepository

  }

}

