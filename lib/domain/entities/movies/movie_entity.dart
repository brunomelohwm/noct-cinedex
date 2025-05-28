import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final List<int> genresId;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  const MovieEntity({
    required this.id,
    required this.genresId,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
    id,
    genresId,
    overview,
    posterPath,
    releaseDate,
    title,
    voteAverage,
  ];
}
