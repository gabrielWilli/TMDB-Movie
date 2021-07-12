import 'package:filmeira/core/error/exception.dart';
import 'package:filmeira/core/network/network_info.dart';
import 'package:filmeira/features/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:filmeira/features/movies/domain/entities/movie_entity.dart';
import 'package:filmeira/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:filmeira/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepositoryAbs {

  final MovieRemoteDataSourceAbs remoteDataSourceAbs;
  final NetworkInfoAbs networkInfo;

  MovieRepositoryImpl({required this.remoteDataSourceAbs, required this.networkInfo});

  @override
  Future<Either<Failure, List<MovieEntity>>> getListMovieNowPlayingRemote() async {
    try {
      if(!await networkInfo.isConnected) {
        throw NetworkFailure();
      }
      var returnMovie = await remoteDataSourceAbs.getListMovieNowPlaying();
      return Right(returnMovie);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkFailure {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getListMoviePopularRemote() async {
   try {
     if(!await networkInfo.isConnected) {
       throw NetworkFailure();
     }
     var returnMovie = await remoteDataSourceAbs.getListMovieNowPlaying();
     return Right(returnMovie);
   } on ServerFailure {
     throw (Left(ServerFailure()));
   } on NetworkFailure {
     return Left(NetworkFailure());
   }
  }
}
