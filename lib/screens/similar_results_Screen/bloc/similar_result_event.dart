part of'similar_result_bloc.dart';

@immutable
abstract class SimilarResultEvent {}

class FetchSimilarResultEvent extends SimilarResultEvent {
  @override
  // TODO: implement props
  String movieId;
  FetchSimilarResultEvent({required this.movieId});

  List<Object> get props => [movieId];
}