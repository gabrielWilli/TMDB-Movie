import 'dart:convert';

import 'package:filmeira/features/movies/data/models/movie_model.dart';
import 'package:filmeira/features/movies/domain/entities/movie_entity.dart';
import 'package:filmeira/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:filmeira/features/movies/domain/repositories/movie_repository.dart';
import 'package:http/http.dart' as http;

class MovieRepositoryImpl implements MovieRepositoryAbs {
  late final String _keyApi = '12d88dff511df1bb152186e7132837ac';
  late final String _baseUrlApi = 'https://api.themoviedb.org/3';

  @override
  Future<Either<Failure, List<MovieEntity>>> getListMovieNowPlaying() async {
    final response = await http.get(Uri.parse(
        '$_baseUrlApi/movie/now_playing?api_key=$_keyApi&language=pt-BR&page=1'));

    if (response.statusCode == 200) {
      Map jsonResponse = jsonDecode(response.body);
      var results = jsonResponse['results'];
      return results.map((item) => MovieModel.fromJson(item));
    } else {
      throw Exception('Falha ao carregar os filmes');
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getListMoviePopular() async {
    final response = await http.get(Uri.parse(
        '$_baseUrlApi/movie/popular?api_key=$_keyApi&language=pt-BR&page=1'));

    if (response.statusCode == 200) {
      Map jsonResponse = jsonDecode(response.body);
      var results = jsonResponse['results'];
      return results.map((item) => MovieModel.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao carregar os filmes');
    }
  }
}
