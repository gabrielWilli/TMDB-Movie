part of 'movie_now_playing_bloc.dart';

class MovieNowPlayingState extends Equatable {
  const MovieNowPlayingState();

  @override
  List<Object?> get props => [];
}

class MovieNowPlayingLoadingState extends MovieNowPlayingState {}

class MovieNowPlayingLoadedState extends MovieNowPlayingState {
  final List<MovieModel> movieModel;

  MovieNowPlayingLoadedState(this.movieModel);

  @override
  List<Object> get props => [movieModel];
}

class MovieNowPlayingErrorState extends MovieNowPlayingState {
  final String message;

  const MovieNowPlayingErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
