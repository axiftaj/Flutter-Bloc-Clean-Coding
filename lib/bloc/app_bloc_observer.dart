import 'package:bloc/bloc.dart';

import '../utils/logger.dart';


class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.i(bloc.runtimeType, error: event);
  }

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   super.onChange(bloc, change);
  //   logger.i(bloc.runtimeType, change);
  // }

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   logger.i(bloc.runtimeType, transition);
  // }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.e(bloc.runtimeType, error: error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
