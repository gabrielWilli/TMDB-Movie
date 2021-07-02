part of 'movie_popular_bloc.dart';

class MoviePopularState extends Equatable {
  const MoviePopularState();

  @override
  List<Object?> get props => [];
}

class MoviePopularLoadingState extends MoviePopularState {}

class MoviePopularLoadedState extends MoviePopularState {
  final List<MovieEntity> movieEntity;

  MoviePopularLoadedState(this.movieEntity);

  @override
  List<Object> get props => [movieEntity];
}

class MoviePopularErrorState extends MoviePopularState {
  final String message;

  const MoviePopularErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
