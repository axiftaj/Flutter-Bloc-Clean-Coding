part of 'movies_bloc.dart';




class MoviesState extends Equatable {

  MoviesState({
     required this.moviesList  ,
    }) ;

   ApiResponse<MovieListModel> moviesList ;

   MoviesState copyWith({
     ApiResponse<MovieListModel>? moviesList,
   }) {
     return MoviesState(
       moviesList: moviesList ?? this.moviesList,
     );
   }

  @override
  // TODO: implement props
  List<Object?> get props => [moviesList];

}


