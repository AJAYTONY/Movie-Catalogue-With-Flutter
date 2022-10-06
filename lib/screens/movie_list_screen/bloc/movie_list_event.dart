part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListEvent {}

class FetchMovieEvent extends MovieListEvent {
  @override
  // TODO: implement props
  String movieType;
  FetchMovieEvent({required this.movieType});

  List<Object> get props => [movieType];
}