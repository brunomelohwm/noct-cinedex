import 'package:dio/dio.dart';
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
      final response = await dio.get('/movie/popular');

      if (response.statusCode == 200) {
        final List results = response.data['results'];
        return results.map((json) => MovieModel.fromMap(json)).toList();
      } else {
        //! remover depois
        print('Erro de status: ${response.statusCode}');
        print('Body: ${response.data}');
        throw Exception('Erro ao buscar filmes populares');
      }
    } catch (e) {
      throw Exception("Erro na requisição: $e ");
    }
  }
}
