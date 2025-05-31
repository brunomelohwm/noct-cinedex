import 'package:dartz/dartz.dart';
import 'package:noct_cinedex/core/errors/failures.dart';
import 'package:noct_cinedex/core/usecase/usecase.dart';
import 'package:noct_cinedex/domain/entities/movies/movie_entity.dart';
import 'package:noct_cinedex/domain/repositories/movie_repository.dart';

class GetMoviePopularUseCase implements Usecase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;
  GetMoviePopularUseCase({required this.movieRepository});

  @override
  Future<Either<Failure, List<MovieEntity>>> call({
    required NoParams params,
  }) async {
    final movies = await movieRepository.getPopularMovies();
    return movies;
  }
}
