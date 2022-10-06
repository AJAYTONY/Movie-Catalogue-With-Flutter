import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_catalouge_with_flutter/constant/constant_config.dart';
import 'package:movie_catalouge_with_flutter/data/models/cast_or_crew_model.dart';
import 'package:movie_catalouge_with_flutter/data/models/movie_detail_response.dart';
import 'package:movie_catalouge_with_flutter/data/models/movie_list_response.dart';
import 'package:http/http.dart' as http;
import 'package:movie_catalouge_with_flutter/data/models/review_model.dart';
import 'package:movie_catalouge_with_flutter/data/models/similar_result_model.dart';

abstract class MovieRepository {
  var client = http.Client();

  Future<List<Results>?> getMovieList(String movieType);

  Future<MovieDetailResponse?>? getMovieDetail(String movieId);

  Future<CastOrCrewModel?> getCastOrCrew(String movieId);

  Future<List<ReviewResults>?> getReviewList(String movieId);

  Future<List<SimilarResults>?> getSimilarList(String movieId);
}

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<List<Results>?> getMovieList(String movieType) async {
    var movieTypes = 'now_playing';
    // var response = await http.get("$baseUrl + movie/$movieType?api_key=$key");
    // var response = await http.get(baseUrl + "movie/upcoming?api_key=$key");
    //var response = await _dio.get("${ConstantConfig.baseUrl}movie/$movieType?api_key=${ConstantConfig.api_key}");

    var response = await client.get(Uri.parse(
        '${ConstantConfig.baseUrl}movie/$movieTypes?api_key=${ConstantConfig.api_key}'));
    // var response = await client.get(Uri.parse(
    //     'https://api.themoviedb.org/3/movie/now_playing?api_key=139ebb0ddadbbb89e5f868d4b6e8448a'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Results>? movies = MovieListResponse.fromJson(data).results;

      return movies;
    } else {
      //throw Exception();
      return null;
    }
  }

  @override
  Future<MovieDetailResponse?>? getMovieDetail(String movieId) async {
    var movieTypes = 'now_playing';
    // var response = await client.get(Uri.parse(
    //     'https://api.themoviedb.org/3/movie/744276?api_key=139ebb0ddadbbb89e5f868d4b6e8448a'));

    var response = await client.get(Uri.parse(
        '${ConstantConfig.baseUrl}movie/$movieId?api_key=${ConstantConfig.api_key}'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      MovieDetailResponse? movies = MovieDetailResponse.fromJson(data);

      return movies;
    } else {
      //throw Exception();
      return null;
    }
  }

  @override
  Future<CastOrCrewModel?> getCastOrCrew(String movieId) async {
    var movieTypes = 'now_playing';
    var response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/760161/credits?api_key=139ebb0ddadbbb89e5f868d4b6e8448a'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      debugPrint("cast crew model $data");

      CastOrCrewModel? castOrCrewModel =
          CastOrCrewModel.fromJson(data);

      return castOrCrewModel;
    } else {
      //throw Exception();
      return null;
    }
  }

  @override
  Future<List<ReviewResults>?> getReviewList(String movieId) async {
    //var response = await client.get(Uri.parse('${ConstantConfig.baseUrl}movie/$movieTypes?api_key=${ConstantConfig.api_key}'));
    // var response = await client.get(Uri.parse(
    //     '${ConstantConfig.baseUrl}movie/$movieId/reviews?api_key=${ConstantConfig.api_key}'));
    var response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/760161/reviews?api_key=139ebb0ddadbbb89e5f868d4b6e8448a'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<ReviewResults>? reviewResult = ReviewModel.fromJson(data).results;

      return reviewResult;
    } else {
      //throw Exception();
      return null;
    }
  }

  @override
  Future<List<SimilarResults>?> getSimilarList(String movieId) async {
    //var response = await client.get(Uri.parse('${ConstantConfig.baseUrl}movie/$movieTypes?api_key=${ConstantConfig.api_key}'));
    // var response = await client.get(Uri.parse(
    //     '${ConstantConfig.baseUrl}movie/$movieId/reviews?api_key=${ConstantConfig.api_key}'));
    var response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/760161/similar?api_key=139ebb0ddadbbb89e5f868d4b6e8448a'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<SimilarResults>? similarResult = SimilarResultModel.fromJson(data).results;

      return similarResult;
    } else {
      //throw Exception();
      return null;
    }
  }
}
