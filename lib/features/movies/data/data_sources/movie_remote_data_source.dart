import 'dart:convert';

import 'package:filmeira/core/error/exception.dart';
import 'package:filmeira/features/movies/data/models/movie_model.dart';
import 'package:filmeira/utils/format_url_api.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSourceAbs {
  Future<List<MovieModel>> getListMoviePopular();
  Future<List<MovieModel>> getListMovieNowPlaying();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSourceAbs {
  Api api = Api();

  @override
  Future<List<MovieModel>> getListMovieNowPlaying() => _getMovieFromUrl(api('movie/now_playing'));

  @override
  Future<List<MovieModel>> getListMoviePopular() => _getMovieFromUrl(api('movie/popular'));

  Future<List<MovieModel>> _getMovieFromUrl(String url) async {
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      Map jsonResponse = jsonDecode(response.body);
      var results = jsonResponse['results'];
      return results.map((item) => MovieModel.fromJson(item));
    } else {
      throw ServerException();
    }
  }
}

