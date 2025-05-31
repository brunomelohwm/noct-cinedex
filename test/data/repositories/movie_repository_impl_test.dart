import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:noct_cinedex/core/errors/failures.dart';
import 'package:noct_cinedex/core/network/network_info.dart';
import 'package:noct_cinedex/data/datasource/movie_remote_data_source.dart';
import 'package:noct_cinedex/data/repositories/movie_repository_impl.dart';
import 'package:noct_cinedex/domain/repositories/movie_repository.dart';

import '../../mocks/movie_model_mock.dart';

class MockMovieRemotedataSource extends Mock
    implements MovieRemoteDataSourceImpl {}

class MockDio extends Mock implements Dio {}

class MockNetworkInfo extends Mock implements NetworkInfoImpl {}

void main() {
  late MovieRepository movieRepository;
  late MockMovieRemotedataSource mockMovieRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockMovieRemoteDataSource = MockMovieRemotedataSource();
    mockNetworkInfo = MockNetworkInfo();

    movieRepository = MovieRepositoryImpl(
      remoteDataSource: mockMovieRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  test('Should return a list of movie from remote', () async {
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(
      () => mockMovieRemoteDataSource.getPopularMovies(),
    ).thenAnswer((_) async => tMovieList);

    final result = await movieRepository.getPopularMovies();

    expect(result, Right(tMovieList));
  });

  test('Should return a ServerFailure when its fails', () async {
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(
      () => mockMovieRemoteDataSource.getPopularMovies(),
    ).thenThrow(Exception('Sem conexão com a internet.'));

    final result = await movieRepository.getPopularMovies();

    expect(
      result,
      Left(ServerFailure(message: 'Exception: Sem conexão com a internet.')),
    );
  });

  test('Should return a NetworkFailure when internet fails', () async {
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    when(
      () => mockMovieRemoteDataSource.getPopularMovies(),
    ).thenAnswer((_) async => tMovieList);

    final result = await movieRepository.getPopularMovies();

    expect(
      result,
      Left(NetworkFailure(message: 'Sem conexão com a internet.')),
    );
  });
}
