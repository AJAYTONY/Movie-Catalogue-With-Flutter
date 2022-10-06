import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/movie_detail_response.dart';
import '../../../data/repository/MovieRepository.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieRepository movieRepository;

  MovieDetailBloc({required this.movieRepository}) : super(MovieDetailInitialState()) {
    on<MovieDetailEvent>((event, emit) async {
      if (event is FetchMovieDetailEvent) {
        emit(MovieDetailLoadingState());
        MovieDetailResponse? movieDetail =
        await movieRepository.getMovieDetail(event.movieId);

        if (movieDetail == null) {
          emit(MovieDetailErrorState());
        } else {
          emit(MovieDetailLoadedState(moviesDetail: movieDetail));
        }
      }
    });
  }
}