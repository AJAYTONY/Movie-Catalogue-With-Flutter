part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListState {}

class MovieInitialState extends MovieListState{}

class MovieLoadingState extends MovieListState {}

class MovieLoadedState extends MovieListState {
  List<Results>? movies;
  MovieLoadedState({required this.movies});
 // get moviesList => movies;

}

class MovieErrorState extends MovieListState {
  // String message;
  // MovieErrorState({required this.message});
  // @override
  // // TODO: implement props
  // List<Object> get props => [];
}