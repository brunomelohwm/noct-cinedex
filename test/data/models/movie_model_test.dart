import 'package:flutter_test/flutter_test.dart';
import 'package:noct_cinedex/data/models/movies/movie_model.dart';
import '../../mocks/movie_json_string_mock.dart';
import '../../mocks/movie_model_mock.dart';
import '../../mocks/movie_model_json_mock.dart';

void main() {
  test('should return a valid movie model from json', () {
    final result = MovieModel.fromMap(tMovieModelJson);

    expect(result, tMovieModel);
  });

  test('should create a movie model from Json String', () {
    final result = MovieModel.fromJson(tJsonString);

    expect(result, equals(tMovieModel));
  });
}
