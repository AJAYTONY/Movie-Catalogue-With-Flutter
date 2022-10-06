import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_catalouge_with_flutter/data/models/cast_or_crew_model.dart';

class CastCrewScreen extends StatelessWidget {
  List<CastOrCrewModel>? castOrCrewModel;

  CastCrewScreen(this.castOrCrewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, i) {
        return SizedBox(
          width: 8,
        );
      },
      itemCount: castOrCrewModel!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [Container(decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // image: DecorationImage(
              //     image: castOrCrewModel[index]
              //
              //
              //
              //     fit: BoxFit.cover),
              color: Colors.grey),)
          ],
        );
      },
    ); //listview horizontal
  }
}
