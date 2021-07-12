import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmeira/core/error/failure.dart';
import 'package:filmeira/core/usecase/usecase.dart';
import 'package:filmeira/core/utils/message_error.dart';
import 'package:filmeira/features/movies/domain/entities/movie_entity.dart';
import 'package:filmeira/features/movies/domain/usecases/get_movie_now_playing.dart';

part 'movie_now_playing_event.dart';

part 'movie_now_playing_state.dart';

// 21621.39875.44276

class MovieNowPlayingBloc
    extends Bloc<MovieNowPlayingEvent, MovieNowPlayingState> {
  final GetMovieNowPlaying getMovieNowPlaying; // no debug esta retornando null

  MovieNowPlayingBloc({required GetMovieNowPlaying nowPlaying})
      : getMovieNowPlaying = nowPlaying,
        super(MovieNowPlayingLoadingState());

  @override
  Stream<MovieNowPlayingState> mapEventToState(
      MovieNowPlayingEvent event) async* {
    if (event is FetchMovieNowPlayEvent) {
      try {
        yield MovieNowPlayingLoadingState();

        final failureOrResponse = await getMovieNowPlaying(NoParams());
        yield* _eitherLoadedOrErrorState(failureOrResponse);
      } catch (error) {
        print('Erro ao listar filmes >>>>>>>>>>>>>> $error');
        yield MovieNowPlayingErrorState('Houve um erro ao listar os filmes');
      }
    }
  }

  Stream<MovieNowPlayingState> _eitherLoadedOrErrorState(
      Either<Failure, List<MovieEntity>> failureOrListMovieEntity) async* {
    yield failureOrListMovieEntity.fold(
      (failure) => MovieNowPlayingErrorState(mapFailureToMessage(failure)),
      (movie) => MovieNowPlayingLoadedState(movie),
    );
  }
}
