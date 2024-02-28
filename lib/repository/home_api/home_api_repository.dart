import '../../model/movie_list/movie_list_model.dart';

abstract class HomeApiRepository {
  Future<MovieListModel> fetchMoviesList();
}