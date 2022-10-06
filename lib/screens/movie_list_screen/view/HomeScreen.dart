import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_catalouge_with_flutter/data/models/movie_list_response.dart';
import 'package:movie_catalouge_with_flutter/screens/movie_detail_screen/view/movie_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Results>? movies;

  HomeScreen(this.movies);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return ListView.separated(
        separatorBuilder: (context, index) =>
            Divider(color: Colors.transparent),
        itemCount: movies!.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(4.0),
            height: height * 0.19,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MovieDetailScreen(movies![index])));
                    },
                    child: Container(
                      height: height * 0.162,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xFF1a1c20),
                              Color(0xFF222222),
                            ]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: height * 0.162 + 16,
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  movies![index].title!,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                      fontFamily: "Poppins-Medium",
                                      fontWeight: FontWeight.w300,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.calendar_today_sharp,
                                      size: MediaQuery.of(context).size.width *
                                          0.033,
                                      color: Colors.white60,
                                    ),
                                    Text(
                                      "${movies![index].releaseDate}",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: "Poppins-Bold",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.033),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.thumb_up_off_alt,
                                      size: MediaQuery.of(context).size.width *
                                          0.033,
                                      color: Colors.white60,
                                    ),
                                    Text(
                                      " ${movies![index].voteCount}",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w200,
                                          fontFamily: "Poppins-Semibold",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.033),
                                    ),
                                    Text(
                                      "  |  Rate: ${movies![index].voteAverage}/10",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w200,
                                          fontFamily: "Poppins-Semibold",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.033),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 0,
                  height: height * 0.19,
                  width: height * 0.15,
                  child: InkWell(
                    onTap: () { Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            MovieDetailScreen(movies![index])));
                    },
                    child: Hero(
                      tag:
                          "https://image.tmdb.org/t/p/w1280${movies![index].id}",
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF333333),
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: kIsWeb
                              ? Image.network(
                                  "https://image.tmdb.org/t/p/w1280${movies![index].posterPath}",
                                  width: 145,
                                  fit: BoxFit.cover)
                              : CachedNetworkImage(
                                  width: 145,
                                  imageUrl:
                                      "https://image.tmdb.org/t/p/w1280${movies![index].posterPath}",
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
