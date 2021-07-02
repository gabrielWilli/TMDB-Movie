part of 'movie_now_playing_bloc.dart';

class MovieNowPlayingState extends Equatable {
  const MovieNowPlayingState();

  @override
  List<Object?> get props => [];
}

class MovieNowPlayingLoadingState extends MovieNowPlayingState {}

class MovieNowPlayingLoadedState extends MovieNowPlayingState {
  final List<MovieEntity> movieEntity;

  MovieNowPlayingLoadedState(this.movieEntity);

  @override
  List<Object> get props => [movieEntity];
}

class MovieNowPlayingErrorState extends MovieNowPlayingState {
  final String message;

  const MovieNowPlayingErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
