import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalouge_with_flutter/data/models/review_model.dart';
import 'package:movie_catalouge_with_flutter/widget/Txt.dart';
import '../bloc/review_bloc.dart';

class ReviewScreen2 extends StatefulWidget {
  const ReviewScreen2({Key? key}) : super(key: key);

  @override
  _ReviewScreen2State createState() => _ReviewScreen2State();
}

class _ReviewScreen2State extends State<ReviewScreen2> {
  ReviewBloc? reviewBloc;

  @override
  void initState() {
    // reviewBloc = BlocProvider.of<ReviewBloc>(context);
    // reviewBloc!.add(FetchReviewEvent(movieId: "760193"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: EdgeInsets.all(16),
      // alignment: Alignment.center,
      //height: 70,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<ReviewBloc, ReviewState>(
        builder: (context, state) {
          if (state is ReviewInitialState) {
            print("Ajay:: Initial Review");
            return CircularProgressIndicator();
          } else if (state is ReviewLoadingState) {
            print("Ajay:: Loading Review");
            return CircularProgressIndicator();
          } else if (state is ReviewLoadedState) {
            print("Ajay:: Loaded Review ");
            return reviewContainer(state.review!, context);
          } else if (state is ReviewErrorState) {
            print("Error Review");
            return Text("Feild to load !");
          }
          return Text('Internet Error Detail');
        },
      ),
    );
  }
}

reviewContainer(List<ReviewResults> review, BuildContext context) {
  print('Review length::  ${review.length}');
  return review.isEmpty
      ? Txt('    No Review Found ',
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins-Bold",
      fontSize: MediaQuery.of(context).size.width * 0.04)
      : ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: review.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero(
                  //   tag:
                  //   "https://image.tmdb.org/t/p/w1280${review[index].id}",
                  //   child: Container(
                  //     height: MediaQuery.of(context).size.height * 0.09,
                  //     color: Color(0xFF333333),
                  //     child: kIsWeb
                  //         ? Image.network(
                  //         "https://image.tmdb.org/t/p/w1280${review[index].authorDetails!.avatarPath}",
                  //         width: double.infinity,
                  //         fit: BoxFit.cover)
                  //         : CachedNetworkImage(
                  //       width: double.infinity,
                  //       imageUrl:
                  //       "https://image.tmdb.org/t/p/w1280${review[index].authorDetails!.avatarPath}",
                  //       fit: BoxFit.fill,
                  //     ),
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(
                            'https://image.tmdb.org/t/p/w1280${review[index].authorDetails!.avatarPath}'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Txt(review[index].authorDetails!.username.toString(),
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins-Bold",
                          fontSize: MediaQuery.of(context).size.width * 0.04)
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Txt(review[index].content.toString(),
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Poppins-Semibold",
                      fontSize: MediaQuery.of(context).size.width * 0.040)
                ],
              ),
            );
          },
        );
}
