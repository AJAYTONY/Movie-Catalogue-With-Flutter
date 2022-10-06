part of'review_bloc.dart';

@immutable
abstract class ReviewEvent {}

class FetchReviewEvent extends ReviewEvent {
  @override
  // TODO: implement props
  String movieId;
  FetchReviewEvent({required this.movieId});

  List<Object> get props => [movieId];
}