import 'package:dartz/dartz.dart';
import 'package:noct_cinedex/core/errors/failures.dart';
import 'package:noct_cinedex/core/network/network_info.dart';
import 'package:noct_cinedex/data/datasource/movie_remote_data_source.dart';
import 'package:noct_cinedex/domain/entities/movies/movie_entity.dart';
import 'package:noct_cinedex/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final movieModel = await remoteDataSource.getPopularMovies();
        return Right(movieModel);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
