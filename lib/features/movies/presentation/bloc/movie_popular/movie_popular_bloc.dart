import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmeira/core/error/failure.dart';
import 'package:filmeira/core/usecase/usecase.dart';
import 'package:filmeira/core/utils/message_error.dart';
import 'package:filmeira/features/movies/domain/entities/movie_entity.dart';
import 'package:filmeira/features/movies/domain/usecases/get_movie_popular.dart';

part 'movie_popular_event.dart';
part 'movie_popular_state.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  final GetMoviePopular getMoviePopular;

  MoviePopularBloc({
    required GetMoviePopular popular,
  })  : getMoviePopular = popular,
        super(MoviePopularLoadingState());

  @override
  Stream<MoviePopularState> mapEventToState(MoviePopularEvent event) async* {
    if (event is FetchMoviePopularEvent) {
      try {
        yield MoviePopularLoadingState();

        final Either<Failure, List<MovieEntity>> failureOrResponse = await getMoviePopular(NoParams());
        yield* _eitherLoadedOrErrorState(failureOrResponse);
      } catch (error) {
        print('Erro ao listar filmes >>>>>>>>>>>>>> $error');
        yield MoviePopularErrorState('Houve um erro ao listar os filmes');
      }
    }
  }

  Stream<MoviePopularState> _eitherLoadedOrErrorState(
      Either<Failure, List<MovieEntity>> failureOrListMovieEntity) async* {
    yield failureOrListMovieEntity.fold(
      (failure) => MoviePopularErrorState(mapFailureToMessage(failure)),
      (movie) => MoviePopularLoadedState(movie),
    );
  }
}
