import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalouge_with_flutter/data/models/similar_result_model.dart';
import 'package:movie_catalouge_with_flutter/screens/similar_results_Screen/bloc/similar_result_bloc.dart';
import 'package:movie_catalouge_with_flutter/widget/Txt.dart';

class SimilarResultScreen extends StatefulWidget {
  const SimilarResultScreen(int? movieId, {Key? key}) : super(key: key);

  @override
  _SimilarResultScreenState createState() => _SimilarResultScreenState();
}

class _SimilarResultScreenState extends State<SimilarResultScreen> {
  //SimilarResultBloc? similarResultBloc;

  @override
  void initState() {
    super.initState();
    // similarResultBloc = BlocProvider.of<SimilarResultBloc>(context);
    // similarResultBloc!.add(FetchSimilarResultEvent(movieId: "760193"));
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      // margin: EdgeInsets.all(16),
      // alignment: Alignment.center,
      //height: 70,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<SimilarResultBloc, SimilarResultState>(
        builder: (context, state) {
          if (state is SimilarResultInitialState) {
            print("Ajay:: Initial Similar");
            return CircularProgressIndicator();
          } else if (state is SimilarResultLoadingState) {
            print("Ajay:: Loading Similar");
            return CircularProgressIndicator();
          } else if (state is SimilarResultLoadedState) {
            print("Ajay:: Loaded Similar ${state.movieId!.length}");
            return similarContainer(state.movieId!,width);
          } else if (state is SimilarResultErrorState) {
            print("Error Similar");
            return Text("Feild to load !");
          }
          return Text('Internet Error Detail');
        },
      ),
    );
  }
}

similarContainer(List<SimilarResults> similarResult,double width) {

  return Container(
    height: width / 2,
    width: width,
    margin: EdgeInsets.only(bottom: 8.0),
    child: ListView.builder(
     // shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: similarResult.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 16, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag:
                "https://image.tmdb.org/t/p/w1280${similarResult[index].id}",
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: 100,
                  color: Color(0xFF333333),
                  child: kIsWeb
                      ? Image.network(
                      'https://image.tmdb.org/t/p/w1280${similarResult[index].posterPath}',
                      width: width,
                      fit: BoxFit.cover)
                      : CachedNetworkImage(
                    width: width,
                    imageUrl:
                    'https://image.tmdb.org/t/p/w1280${similarResult[index].posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // SizedBox(
              //   width: 8,
              // ),
              Txt(similarResult[index].title.toString(),
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Poppins-Semibold",
                  fontSize: MediaQuery.of(context).size.width * 0.040)
            ],
          ),
        );
      },
    ),
  );
}
