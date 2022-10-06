part of'movie_detail_bloc.dart';

abstract class MovieDetailState {}

class MovieDetailInitialState extends MovieDetailState{}

class MovieDetailLoadingState extends MovieDetailState {}

class MovieDetailLoadedState extends MovieDetailState {
  MovieDetailResponse? moviesDetail;
  MovieDetailLoadedState({required this.moviesDetail});
// get moviesList => movies;

}

class MovieDetailErrorState extends MovieDetailState {
  // String message;
  // MovieErrorState({required this.message});
  // @override
  // // TODO: implement props
  // List<Object> get props => [];
}