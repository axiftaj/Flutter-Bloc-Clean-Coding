import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/data/response/api_response.dart';
import 'package:bloc_clean_coding/data/response/response.dart';
import 'package:equatable/equatable.dart';
import '../../model/movie_list/movie_list_model.dart';
import '../../repository/home_api/home_api_repository.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {

  HomeApiRepository  homeRepository ;
  MoviesBloc({required this.homeRepository}) : super(MoviesState(moviesList: ApiResponse.loading())) {
    on<PostFetched>(fetchMoviesListApi);
  }

  Future<void> fetchMoviesListApi (PostFetched event, Emitter<MoviesState> emit)async{

    await homeRepository.fetchMoviesList().then((response){
      emit(
          state.copyWith(
              moviesList: ApiResponse.completed(response),
          )
      );
    }).onError((error, stackTrace){
      emit(
          state.copyWith(
            moviesList: ApiResponse.error(error.toString()),
          )
      );
    });
  }
}
