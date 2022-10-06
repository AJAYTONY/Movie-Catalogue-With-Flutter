part of 'cast_crew_bloc.dart';

abstract class CastCrewEvent {}

class FetchCastCrewEvent extends CastCrewEvent {
  @override
  // TODO: implement props
  String movieId;
  FetchCastCrewEvent({required this.movieId});

  List<Object> get props => [movieId];
}