import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalouge_with_flutter/data/models/similar_result_model.dart';
import 'package:movie_catalouge_with_flutter/data/repository/MovieRepository.dart';

part 'similar_result_event.dart';
part 'similar_result_state.dart';

class SimilarResultBloc extends Bloc<SimilarResultEvent, SimilarResultState> {
  final MovieRepository movieRepository;

  SimilarResultBloc({required this.movieRepository}) : super(SimilarResultInitialState()) {
    on<SimilarResultEvent>((event, emit) async {
      if (event is FetchSimilarResultEvent) {
        emit(SimilarResultLoadingState());
        List<SimilarResults>? similarResult =
        await movieRepository.getSimilarList(event.movieId);

        if (similarResult == null) {
          emit(SimilarResultErrorState());
        } else {
          emit(SimilarResultLoadedState(movieId: similarResult));
        }
      }
    });
  }



}
