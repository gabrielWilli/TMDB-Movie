import 'package:dartz/dartz.dart';
import 'package:filmeira/core/error/failure.dart';
import 'package:filmeira/features/movies/domain/entities/movie_entity.dart';

abstract class MovieRepositoryAbs {
  //remote
  Future<Either<Failure, List<MovieEntity>>> getListMoviePopular();
  Future<Either<Failure, List<MovieEntity>>> getListMovieNowPlaying();

  //cache

}