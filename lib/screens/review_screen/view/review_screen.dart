import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../data/models/review_model.dart';

class ReviewScreen extends StatelessWidget {
  final List<ReviewResults>? reviewResult;

  const ReviewScreen(
    this.reviewResult, {
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: reviewResult!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: <Widget>[
                  // Text('Review List', style: TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w300,
                  //     fontFamily: "Poppins-Medium",
                  //     fontSize: MediaQuery.of(context).size.width * 0.05))
                  Hero(
                    tag:
                        "https://image.tmdb.org/t/p/w1280${reviewResult![index].id}",
                    child: Container(
                      height: height * 0.30,
                      color: Color(0xFF333333),
                      child: kIsWeb
                          ? Image.network(
                              "https://image.tmdb.org/t/p/w1280${reviewResult![index].authorDetails!.avatarPath}",
                              width: double.infinity,
                              fit: BoxFit.cover)
                          : CachedNetworkImage(
                              width: double.infinity,
                              imageUrl:
                                  "https://image.tmdb.org/t/p/w1280${reviewResult![index].authorDetails!.avatarPath}",
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
