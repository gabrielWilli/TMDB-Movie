import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:filmeira/features/movies/domain/entities/movie_entity.dart';

part 'movie_popular_event.dart';
part 'movie_popular_state.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  MoviePopularBloc() : super(MoviePopularLoadingState());

  @override
  Stream<MoviePopularState> mapEventToState(
    MoviePopularEvent event,
  ) async* {
    if (event is FetchMoviePopularEvent) {
      try {
        yield MoviePopularLoadingState();

        //usecase

        // yield MoviePopularLoadedState(listMovies);
      } catch (error) {
        print('Erro ao listar filmes >>>>>>>>>>>>>> $error');
        yield MoviePopularErrorState('Houve um erro ao listar os filmes');
      }
    }
  }
}
