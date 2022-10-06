part of 'cast_crew_bloc.dart';

abstract class CastCrewState {}

class CastCrewInitialState extends CastCrewState{}

class CastCrewLoadingState extends CastCrewState {}

class CastCrewLoadedState extends CastCrewState {
  List<CastOrCrewModel>? castOrCrewModel;
  CastCrewLoadedState({required this.castOrCrewModel});
// get moviesList => movies;

}

class CastCrewErrorState extends CastCrewState {
  // String message;
  // MovieErrorState({required this.message});
  // @override
  // // TODO: implement props
  // List<Object> get props => [];
}