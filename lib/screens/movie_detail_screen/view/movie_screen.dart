import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalouge_with_flutter/data/models/movie_detail_response.dart';
import 'package:movie_catalouge_with_flutter/screens/cast_or_crew_screen/bloc/cast_crew_bloc.dart';
import 'package:movie_catalouge_with_flutter/screens/cast_or_crew_screen/view/CastCrewScreen.dart';
import 'package:movie_catalouge_with_flutter/screens/review_screen/bloc/review_bloc.dart';
import 'package:movie_catalouge_with_flutter/screens/review_screen/view/review_screen.dart';
import 'package:movie_catalouge_with_flutter/screens/similar_results_Screen/view/similar_result_screen.dart';

import '../../../widget/Txt.dart';
import '../../review_screen/view/review_Screen_2.dart';

class MovieDetail extends StatelessWidget {
  MovieDetailResponse? movieDetailResponse;

  MovieDetail(this.movieDetailResponse, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    var genres = '';
    if (movieDetailResponse!.genres != null &&
        movieDetailResponse!.genres!.length > 0) {
      for (var i = 0; i < movieDetailResponse!.genres!.length; i++) {
        genres = genres + movieDetailResponse!.genres![i].name!.trim();
        if (i != movieDetailResponse!.genres!.length - 1) {
          genres = '$genres, ';
        }
      }
    }

    return SingleChildScrollView(
      // physics: NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "https://image.tmdb.org/t/p/w1280${movieDetailResponse!.id}",
            child: Container(
              height: height * 0.30,
              color: Color(0xFF333333),
              child: kIsWeb
                  ? Image.network(
                      "https://image.tmdb.org/t/p/w1280${movieDetailResponse!.backdropPath}",
                      width: double.infinity,
                      fit: BoxFit.cover)
                  : CachedNetworkImage(
                      width: double.infinity,
                      imageUrl:
                          "https://image.tmdb.org/t/p/w1280${movieDetailResponse!.backdropPath}",
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Txt(movieDetailResponse!.title!,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontFamily: "Poppins-Bold",
                color: Color(0xFFFBFBFB) //Color(0xFF5d59d8)
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  movieDetailResponse!.releaseDate!,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins-Bold",
                      color: Colors.blueGrey.shade500 //Color(0xFF5d59d8)
                      ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.thumb_up_off_alt,
                      size: MediaQuery.of(context).size.width * 0.033,
                      color: Colors.white60,
                    ),
                    Text(
                      " ${movieDetailResponse!.voteCount}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w200,
                          fontFamily: "Poppins-Semibold",
                          fontSize: MediaQuery.of(context).size.width * 0.033),
                    ),
                    Text(
                      "  |  Rate: ${movieDetailResponse!.voteAverage}/10",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w200,
                          fontFamily: "Poppins-Semibold",
                          fontSize: MediaQuery.of(context).size.width * 0.033),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: BoxDecoration(
                color: Color(0xFFee6969),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
              child: Text(
                genres,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    fontSize: MediaQuery.of(context).size.width * 0.039,
                    fontFamily: "Poppins-Light"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Text(
              "Story",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Poppins-Medium",
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
            child: Text(
              "${movieDetailResponse!.overview}",
              style: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Poppins-Semibold",
                  fontSize: MediaQuery.of(context).size.width * 0.040),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4),
            child: Text(
              "Cast",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Poppins-Medium",
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
          ),
          Divider(
            height: 0.9,
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.all(16),
            alignment: Alignment.center,
            height: 70,
            width: MediaQuery.of(context).size.width,
            // child: SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: BlocBuilder<CastCrewBloc, CastCrewState>(
            //     builder: (context, state) {
            //       if (state is CastCrewInitialState) {
            //         print("Ajay:: Initial Crew");
            //         return CircularProgressIndicator();
            //       } else if (state is CastCrewLoadingState) {
            //         print("Ajay:: Loading Crew");
            //         return CircularProgressIndicator();
            //       } else if (state is CastCrewLoadedState) {
            //         print("Ajay:: Loaded CastOrCrew ${state.castOrCrewModel!.length}");
            //         return CastCrewScreen(state.castOrCrewModel);
            //       } else if (state is CastCrewErrorState) {
            //         print("Error Crew");
            //         return Text("Feild to load !");
            //       }
            //       return Text('Internet Error Detail');
            //     },
            //   ),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
            child: Text(
              "Crew",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Poppins-Medium",
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
          ),
          Divider(
            height: 0.9,
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.all(16),
            alignment: Alignment.center,
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Text('Crew List',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Poppins-Medium",
                    fontSize: MediaQuery.of(context).size.width * 0.05)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
            child: Text(
              "Reviews",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Poppins-Medium",
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
          ),
          const Divider(
            height: 0.9,
            color: Colors.white,
          ),
          ReviewScreen2(),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
            child: Text(
              "Similar Results",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Poppins-Medium",
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
          ),
          Divider(
            height: 0.9,
            color: Colors.white,
          ),
          SimilarResultScreen(movieDetailResponse!.id),

          // SizedBox(
          //   // margin: EdgeInsets.all(16),
          //   // alignment: Alignment.center,
          //   //height: 70,
          //    width: MediaQuery.of(context).size.width,
          //   child: BlocBuilder<ReviewBloc, ReviewState>(
          //     builder: (context, state) {
          //       if (state is ReviewInitialState) {
          //         print("Ajay:: Initial Review");
          //         return CircularProgressIndicator();
          //       } else if (state is ReviewLoadingState) {
          //         print("Ajay:: Loading Review");
          //         return CircularProgressIndicator();
          //       } else if (state is ReviewLoadedState) {
          //         print("Ajay:: Loaded Review ${state.review!.length}");
          //         return ReviewScreen(state.review);
          //       } else if (state is ReviewErrorState) {
          //         print("Error Review");
          //         return Text("Feild to load !");
          //       }
          //       return Text('Internet Error Detail');
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }



}
