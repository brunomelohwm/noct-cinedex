import 'package:dartz/dartz.dart';
import 'package:noct_cinedex/core/errors/failures.dart';
import 'package:noct_cinedex/domain/entities/movies/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
}
