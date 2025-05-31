import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:noct_cinedex/data/datasource/movie_remote_data_source.dart';

import '../../mocks/movie_list_json_mock.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late MovieRemoteDataSourceImpl datasource;

  setUp(() {
    mockDio = MockDio();
    datasource = MovieRemoteDataSourceImpl(dio: mockDio);
  });

  group('getPopularMovies', () {
    test(
      'Should return a list movies from MovieModel when the statusCode is 200 ',
      () async {
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: {'results': tMovieListJson},
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );

        final result = await datasource.getPopularMovies();

        expect(result.length, 1);
        expect(result.first.titleModel, 'Filme A');
      },
    );

    test(
      'Should return a DioException when a bad response occurs searching for movies ',
      () async {
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: {'results': tMovieListJson},
            statusCode: 400,
            requestOptions: RequestOptions(path: ''),
          ),
        );

        expectLater(
          () async => await datasource.getPopularMovies(),
          throwsA(isA<DioException>()),
        );
      },
    );

    test(
      'Should return a DioException when a bad response occursa unexpected error ',
      () async {
        when(() => mockDio.get(any())).thenThrow(Exception('Falha qualquer'));

        expect(
          () async => await datasource.getPopularMovies(),
          throwsA(isA<DioException>()),
        );
      },
    );
  });
}
