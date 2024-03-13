import '../../model/movie_list/movie_list_model.dart';

/// Abstract class defining methods for movies API repositories.
abstract class MoviesApiRepository {
  /// Fetches the list of movies from the API.
  ///
  /// Returns a [MovieListModel] representing the list of movies.
  Future<MovieListModel> fetchMoviesList();
}
