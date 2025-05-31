import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:noct_cinedex/core/usecase/usecase.dart';
import 'package:noct_cinedex/data/repositories/movie_repository_impl.dart';
import 'package:noct_cinedex/domain/usecases/get_movie_popular_usecase.dart';

import '../../mocks/movie_model_mock.dart';

class MockMovieRepository extends Mock implements MovieRepositoryImpl {}

void main() {
  late MockMovieRepository mockMovieRepository;
  late GetMoviePopularUseCase getMoviePopularUseCase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getMoviePopularUseCase = GetMoviePopularUseCase(
      movieRepository: mockMovieRepository,
    );
  });

  test('Should return a movie list', () async {
    when(
      () => mockMovieRepository.getPopularMovies(),
    ).thenAnswer((_) async => Right(tMovieList));

    final result = await getMoviePopularUseCase(params: NoParams());

    expect(result, Right(tMovieList));
  });
}
