import 'package:dartz/dartz.dart';
import 'package:filmeira/core/error/failure.dart';
import 'package:filmeira/features/movies/domain/entities/movie_entity.dart';

abstract class MovieRepositoryAbs {
  //remote
  Future<Either<Failure, List<MovieEntity>>> getListMoviePopularRemote();
  Future<Either<Failure, List<MovieEntity>>> getListMovieNowPlayingRemote();

  //cache

}