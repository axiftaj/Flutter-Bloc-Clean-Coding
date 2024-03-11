import '../../configs/app_url.dart';
import '../../data/network/network_api_services.dart';
import '../../model/movie_list/movie_list_model.dart';
import 'movies_api_repository.dart';

class MoviesHttpApiRepository implements MoviesApiRepository{

  final _apiServices = NetworkApiService() ;

  @override
  Future<MovieListModel> fetchMoviesList()async{
    final response = await _apiServices.getApi(AppUrl.popularMoviesListEndPoint);
    return  MovieListModel.fromJson(response);
  }

}