import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String? title;
  final String? urlImage;
  final String? date;
  final num? vote;

  MovieEntity({
    required this.title,
    required this.urlImage,
    required this.date,
    required this.vote,
  });

  @override
  List<Object?> get props => [title, urlImage, date, vote];
}
