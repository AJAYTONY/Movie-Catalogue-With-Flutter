part of'similar_result_bloc.dart';

@immutable
abstract class SimilarResultState {}

class SimilarResultInitialState extends SimilarResultState{}

class SimilarResultLoadingState extends SimilarResultState {}

class SimilarResultLoadedState extends SimilarResultState {
  List<SimilarResults>? movieId;
  SimilarResultLoadedState({required this.movieId});
// get moviesList => movies;

}

class SimilarResultErrorState extends SimilarResultState {
  // String message;
  // MovieErrorState({required this.message});
  // @override
  // // TODO: implement props
  // List<Object> get props => [];
}