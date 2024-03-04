part of 'movies_bloc.dart';


abstract class MoviesEvent extends Equatable{
  @override
  List<Object> get props => [];
}


class PostFetched extends MoviesEvent {}