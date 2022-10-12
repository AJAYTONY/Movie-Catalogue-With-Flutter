import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalouge_with_flutter/screens/movie_list_screen/bloc/movie_list_bloc.dart';
import 'package:movie_catalouge_with_flutter/screens/movie_list_screen/view/HomeScreen.dart';
import 'package:movie_catalouge_with_flutter/screens/network_error.dart';
import 'package:movie_catalouge_with_flutter/screens/search_Sceen/view/search_screen.dart';
import 'package:shimmer/shimmer.dart';

class MovieListScreenHome extends StatefulWidget {
  const MovieListScreenHome({Key? key}) : super(key: key);

  @override
  _MovieListScreenHomeState createState() => _MovieListScreenHomeState();
}

class _MovieListScreenHomeState extends State<MovieListScreenHome> {
  MovieListBloc? movieListBloc;

  @override
  void initState() {
    super.initState();
    movieListBloc = BlocProvider.of<MovieListBloc>(context);
    movieListBloc!.add(FetchMovieEvent(movieType: "now_playing"));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            appBar(width),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<MovieListBloc, MovieListState>(
                builder: (context, state) {
                  if (state is MovieInitialState) {
                    print('AJAY:  Initial');
                    return loading();
                  } else if (state is MovieLoadingState) {
                    print('AJAY:  Loading');
                    return loading();
                  } else if (state is MovieLoadedState) {
                     return HomeScreen(state.movies);
                  } else if(state is MovieErrorState){
                    return NetworkError();
                  } else {
                    print('AJAY:  Something went wrong ');
                  }
                  return Text('Internet Error');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Movie List",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.08,
                  fontFamily: "Poppins-Bold",
                  fontWeight: FontWeight.w500),
            ),

          ],
        ),
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          iconSize: width * 0.08,
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (BuildContext context) {
            //       return SearchScreen();
            //     }));
          },
        )
      ],
    );
  }
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


