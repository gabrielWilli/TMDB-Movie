import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:filmeira/features/movies/data/models/movie_model.dart';

part 'movie_now_playing_event.dart';
part 'movie_now_playing_state.dart';

class MovieNowPlayingBloc
    extends Bloc<MovieNowPlayingEvent, MovieNowPlayingState> {
  MovieNowPlayingBloc() : super(MovieNowPlayingLoadingState());

  @override
  Stream<MovieNowPlayingState> mapEventToState(
    MovieNowPlayingEvent event,
  ) async* {
    if (event is FetchMovieNowPlayEvent) {
      try {
        yield MovieNowPlayingLoadingState();

        //usecase

        // yield MovieNowPlayingLoadedState(listMovies);
      } catch (error) {
        print('Erro ao listar filmes >>>>>>>>>>>>>> $error');
        yield MovieNowPlayingErrorState('Houve um erro ao listar os filmes');
      }
    }
  }
}
