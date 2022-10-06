import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalouge_with_flutter/data/models/cast_or_crew_model.dart';
import 'package:movie_catalouge_with_flutter/data/repository/MovieRepository.dart';

part 'cast_crew_event.dart';
part 'cast_crew_state.dart';

class CastCrewBloc extends Bloc<CastCrewEvent, CastCrewState> {
  final MovieRepository movieRepository;

  CastCrewBloc({required this.movieRepository}) : super(CastCrewInitialState()) {
    on<CastCrewEvent>((event, emit) async {
      if (event is FetchCastCrewEvent) {
        emit(CastCrewLoadingState());
        CastOrCrewModel? castOrCrewModel =
        await movieRepository.getCastOrCrew(event.movieId);

        if (castOrCrewModel == null) {
          emit(CastCrewErrorState());
        } else {
          emit(CastCrewLoadedState(castOrCrewModel: castOrCrewModel));
        }
      }
    });
  }
}