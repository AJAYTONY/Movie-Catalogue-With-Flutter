import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalouge_with_flutter/data/models/movie_list_response.dart';
import 'package:movie_catalouge_with_flutter/screens/cast_or_crew_screen/bloc/cast_crew_bloc.dart';
import 'package:movie_catalouge_with_flutter/screens/movie_detail_screen/bloc/movie_detail_bloc.dart';
import 'package:movie_catalouge_with_flutter/screens/movie_list_screen/view/HomeScreen.dart';
import 'package:movie_catalouge_with_flutter/screens/movie_list_screen/view/movie_list_screen.dart';
import 'package:movie_catalouge_with_flutter/screens/network_error.dart';
import 'package:movie_catalouge_with_flutter/screens/review_screen/bloc/review_bloc.dart';
import 'package:movie_catalouge_with_flutter/widget/common_progress_bar.dart';
import 'package:shimmer/shimmer.dart';

import 'movie_screen.dart';

class MovieDetailScreen extends StatefulWidget {
  Results movies;

  MovieDetailScreen(this.movies, {Key? key}) : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailBloc? movieDetailBloc;
  CastCrewBloc? castCrewBloc;
  ReviewBloc? reviewBloc;



  @override
  void initState() {
    super.initState();
    movieDetailBloc = BlocProvider.of<MovieDetailBloc>(context);
    movieDetailBloc!.add(FetchMovieDetailEvent(movieId: widget.movies.id.toString()));

    castCrewBloc = BlocProvider.of<CastCrewBloc>(context);
    castCrewBloc!.add(FetchCastCrewEvent(movieId: widget.movies.id.toString()));

    reviewBloc = BlocProvider.of<ReviewBloc>(context);
    reviewBloc!.add(FetchReviewEvent(movieId: widget.movies.id.toString()));


  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              appBar(width,context),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
                  builder: (context, state) {
                    if (state is MovieDetailInitialState) {
                      print('AJAY:  Initial Detail');
                        return CommonProgressBar();
                    } else if (state is MovieDetailLoadingState) {
                      print('AJAY:  Loading Detail');
                        return CommonProgressBar();
                    } else if (state is MovieDetailLoadedState) {
                      print('AJAY:  Loaded Detail ');
                      return MovieDetail(state.moviesDetail);
                    } else if (state is MovieDetailErrorState) {
                      print('AJAY:  Error Detail');
                      return NetworkError();
                    } else {
                      print('AJAY:  Something went wrong Detail ');
                    }
                    return Text('Internet Error Detail');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget appBar(double width, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        iconSize: width * 0.08,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      Spacer(),
      Align(
        alignment: Alignment.topCenter,
        child: Text("Movie Detail",
          style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.08,
              fontFamily: "Poppins-Bold",
              fontWeight: FontWeight.w500),
        ),
      ),
      Spacer(),
    ],
  );
}

Widget loading() {
  int offset = 0;
  int time;
  return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        offset += 10;
        time = 800 + offset;
        return Shimmer.fromColors(
          period: Duration(milliseconds: time),
          highlightColor: Color(0xFF1a1c20),
          baseColor: Color(0xFF111111),
          child: Container(
            margin: EdgeInsets.all(4.0),
            height: MediaQuery.of(context).size.height * 0.19,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.16,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 0,
                  height: MediaQuery.of(context).size.height * 0.19,
                  width: MediaQuery.of(context).size.height * 0.16,
                  child: Container(
                    width: 145,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
