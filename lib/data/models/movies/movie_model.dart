import 'dart:convert';

import 'package:noct_cinedex/domain/entities/movies/movie_entity.dart';

class MovieModel extends MovieEntity {
  final int idModel;
  final List<int> genresIdModel;
  final String overviewModel;
  final String posterPathModel;
  final String releaseDateModel;
  final String titleModel;
  final double voteAverageModel;

  const MovieModel({
    required this.idModel,
    required this.genresIdModel,
    required this.overviewModel,
    required this.posterPathModel,
    required this.releaseDateModel,
    required this.titleModel,
    required this.voteAverageModel,
  }) : super(
         id: idModel,
         genresId: genresIdModel,
         overview: overviewModel,
         posterPath: posterPathModel,
         releaseDate: releaseDateModel,
         title: titleModel,
         voteAverage: voteAverageModel,
       );
  factory MovieModel.fromMap(Map<String, dynamic> map) {
    print('JSON recebido para MovieModel: $map');
    return MovieModel(
      idModel: map['id'] as int,
      genresIdModel: List<int>.from(map['genre_ids']),
      overviewModel: map['overview'] as String,
      posterPathModel: map['poster_path'] as String,
      releaseDateModel: map['release_date'] as String,
      titleModel: map['title'] as String,
      voteAverageModel: (map['vote_average'] as num).toDouble(),
    );
  }
  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
