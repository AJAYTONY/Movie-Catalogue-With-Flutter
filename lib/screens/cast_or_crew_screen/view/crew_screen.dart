import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_catalouge_with_flutter/data/models/cast_or_crew_model.dart';
import 'package:movie_catalouge_with_flutter/widget/Txt.dart';

class CrewScreen extends StatelessWidget {
  CastOrCrewModel? castOrCrewModel;

  CrewScreen(this.castOrCrewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, i) {
          return SizedBox(
            width: 5,
          );
        },
        itemCount: castOrCrewModel!.crew!.length,
        itemBuilder: (context, index) {
          return Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CircleAvatar(
              //   radius: 35,
              //   child: Image.network(
              //       'https://image.tmdb.org/t/p/w1280${castOrCrewModel!.cast![index].profilePath.toString()}'),
              // ),
              Container(
                height: MediaQuery.of(context).size.width * 0.15 + 15,
                width: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w1280${castOrCrewModel!
                                .crew![index].profilePath.toString()}'),
                        fit: BoxFit.cover),
                    color: Colors.grey),
              ),
              SizedBox(
                height: 8,
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: Txt(castOrCrewModel!.cast![index].name.toString(),
              //       color: Colors.white,
              //       maxLines: 2,
              //       fontWeight: FontWeight.w200,
              //       fontFamily: "Poppins-Medium",
              //       fontSize: MediaQuery.of(context).size.width * 0.04),
              // )
              AutoSizeText(
                castOrCrewModel!.crew![index].name.toString(),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .width * 0.02,
                    color: Color(0xFFfbfbfb),
                    fontFamily: "Poppins-Light"),
              )
            ],
          );
        },
      ),
    ); //listview horizontal
  }
}
