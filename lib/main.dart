import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalouge_with_flutter/data/repository/MovieRepository.dart';
import 'package:movie_catalouge_with_flutter/screens/cast_or_crew_screen/bloc/cast_crew_bloc.dart';
import 'package:movie_catalouge_with_flutter/screens/movie_detail_screen/bloc/movie_detail_bloc.dart';
import 'package:movie_catalouge_with_flutter/screens/movie_list_screen/bloc/movie_list_bloc.dart';
import 'package:movie_catalouge_with_flutter/screens/movie_list_screen/view/movie_list_screen.dart';
import 'package:movie_catalouge_with_flutter/screens/review_screen/bloc/review_bloc.dart';
import 'package:movie_catalouge_with_flutter/screens/similar_results_Screen/bloc/similar_result_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieListBloc>(
          create: (context) =>
              MovieListBloc(movieRepository: MovieRepositoryImpl()),
        ),
        BlocProvider<MovieDetailBloc>(
          create: (context) =>
              MovieDetailBloc(movieRepository: MovieRepositoryImpl()),
        ),
        BlocProvider<CastCrewBloc>(
          create: (context) =>
              CastCrewBloc(movieRepository: MovieRepositoryImpl()),
        ),
        BlocProvider<ReviewBloc>(
          create: (context) =>
              ReviewBloc(movieRepository: MovieRepositoryImpl()),
        ),
        BlocProvider<SimilarResultBloc>(
          create: (context) =>
              SimilarResultBloc(movieRepository: MovieRepositoryImpl()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light),
          child: Scaffold(
              backgroundColor: Colors.black, body: MovieListScreenHome()),
        ),
      ),
    );
  }
}
