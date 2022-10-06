import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalouge_with_flutter/data/models/review_model.dart';
import 'package:movie_catalouge_with_flutter/data/repository/MovieRepository.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final MovieRepository movieRepository;

  ReviewBloc({required this.movieRepository}) : super(ReviewInitialState()) {
    on<ReviewEvent>((event, emit) async {
      if (event is FetchReviewEvent) {
        emit(ReviewLoadingState());
        List<ReviewResults>? reviewList =
        await movieRepository.getReviewList(event.movieId);

        if (reviewList == null) {
          emit(ReviewErrorState());
        } else {
          emit(ReviewLoadedState(review: reviewList));
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
