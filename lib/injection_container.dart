import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:filmeira/features/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:filmeira/features/movies/domain/usecases/get_movie_now_playing.dart';
import 'package:filmeira/features/movies/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:filmeira/features/movies/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'features/movies/data/repositories/movie_repository_impl.dart';
import 'features/movies/domain/repositories/movie_repository.dart';
import 'features/movies/domain/usecases/get_movie_popular.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => MoviePopularBloc(popular: sl()));
  sl.registerFactory(() => MovieNowPlayingBloc(nowPlaying: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetMoviePopular(sl()));
  sl.registerLazySingleton(() => GetMovieNowPlaying(sl()));

  // Repository
  sl.registerLazySingleton<MovieRepositoryAbs>(() => MovieRepositoryImpl(
        remoteDataSourceAbs: sl(),
        networkInfo: sl(),
      ));

  // Data sources
  sl.registerLazySingleton<MovieRemoteDataSourceAbs>(
    () => MovieRemoteDataSourceImpl(),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfoAbs>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
