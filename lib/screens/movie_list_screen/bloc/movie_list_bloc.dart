import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalouge_with_flutter/data/models/movie_list_response.dart';
import 'package:movie_catalouge_with_flutter/data/repository/MovieRepository.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final MovieRepository movieRepository;

  MovieListBloc({required this.movieRepository}) : super(MovieInitialState()) {
    on<MovieListEvent>((event, emit) async {
      if (event is FetchMovieEvent) {
        emit(MovieLoadingState());
        List<Results>? movieList =
            await movieRepository.getMovieList(event.movieType);

        if (movieList == null) {
          emit(MovieErrorState());
        } else {
          emit(MovieLoadedState(movies: movieList));
        }
      }
    });
  }

// MovieListBloc({required this.movieRepository}) : super(MovieInitialState()){
//   @override
//   Stream<MovieListState>? mapEventToState(MovieListEvent event) async* {
//
//     if (event is FetchMovieEvent) {
//       yield MovieLoadingState();
//       try {
//         List<Results>? movies = await movieRepository.getMovieList(event.movieType);
//         yield MovieLoadedState(movies: movies);
//       } catch (e) {
//         yield MovieErrorState(message: e.toString());
//       }
//     }
//   }
// }

// @override
// // TODO: implement initialState
// MovieListState get initialState => MovieInitialState();

}
