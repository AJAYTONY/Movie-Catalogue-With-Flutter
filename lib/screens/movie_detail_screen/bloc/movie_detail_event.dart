part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent {}

class FetchMovieDetailEvent extends MovieDetailEvent {
  @override
  // TODO: implement props
  String movieId;
  FetchMovieDetailEvent({required this.movieId});

  List<Object> get props => [movieId];
}