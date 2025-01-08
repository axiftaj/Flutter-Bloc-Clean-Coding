import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/data/response/api_response.dart';
import 'package:bloc_clean_coding/data/response/response.dart';
import 'package:bloc_clean_coding/repository/movies_api/movies_api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../model/movie_list/movie_list_model.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesApiRepository moviesApiRepository;
  MoviesBloc({required this.moviesApiRepository}) : super(MoviesState(moviesList: ApiResponse.loading())) {
    on<MoviesFetch>(fetchMoviesListApi);
  }

  Future<void> fetchMoviesListApi(MoviesFetch event, Emitter<MoviesState> emit) async {
    await moviesApiRepository.fetchMoviesList().then((response) {
      emit(state.copyWith(
        moviesList: ApiResponse.completed(response),
      ));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(stackTrace);
        print(error);
      }

      emit(state.copyWith(
        moviesList: ApiResponse.error(error.toString()),
      ));
    });
  }
}
