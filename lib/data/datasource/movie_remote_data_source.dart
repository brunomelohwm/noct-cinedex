import 'package:dio/dio.dart';
import 'package:noct_cinedex/core/network/api_urls.dart';
import 'package:noct_cinedex/data/models/movies/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await dio.get(ApiUrls.popularMoviesPath);

      if (response.statusCode == 200) {
        final List results = response.data['results'];

        return results.map((json) => MovieModel.fromMap(json)).toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: "Erro ao buscar filmes populares: ${response.statusCode}",
        );
      }
    } catch (e) {
      if (e is DioException) {
        rethrow;
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: ApiUrls.popularMoviesPath),
          type: DioExceptionType.unknown,
          error: 'erro inesperado: ${e.toString()}',
        );
      }
    }
  }
}
