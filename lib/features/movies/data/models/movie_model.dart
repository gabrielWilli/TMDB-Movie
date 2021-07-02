import 'package:filmeira/features/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final String? title;
  final String? urlImage;
  final String? date;
  final num? vote;

  MovieModel({
    required this.title,
    required this.urlImage,
    required this.date,
    required this.vote,
  }): super (title: title, urlImage: urlImage, date: date, vote: vote);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      urlImage: 'https://image.tmdb.org/t/p/w500' + json['poster_path'],
      date: json['release_date'],
      vote: json['vote_average'],
    );
  }
}
