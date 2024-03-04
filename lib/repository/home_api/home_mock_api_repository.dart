import '../../model/movie_list/movie_list_model.dart';
import 'home_api_repository.dart';

class HomeMockApiRepository implements HomeApiRepository {

  @override
  Future<MovieListModel> fetchMoviesList()async{
    dynamic response = null;
    return  MovieListModel.fromJson(response);
  }

}