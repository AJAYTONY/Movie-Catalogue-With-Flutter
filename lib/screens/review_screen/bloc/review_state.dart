part  of'review_bloc.dart';

@immutable
abstract class ReviewState {}

class ReviewInitialState extends ReviewState{}

class ReviewLoadingState extends ReviewState {}

class ReviewLoadedState extends ReviewState {
  List<ReviewResults>? review;
  ReviewLoadedState({required this.review});
// get moviesList => movies;

}

class ReviewErrorState extends ReviewState {
  // String message;
  // MovieErrorState({required this.message});
  // @override
  // // TODO: implement props
  // List<Object> get props => [];
}