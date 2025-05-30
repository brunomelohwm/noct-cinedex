import 'package:get_it/get_it.dart';
import 'package:noct_cinedex/core/network/network_info.dart';
import 'package:noct_cinedex/data/datasource/movie_remote_data_source.dart';
import 'package:noct_cinedex/data/repositories/movie_repository_impl.dart';
import 'package:noct_cinedex/domain/repositories/movie_repository.dart';
import 'package:noct_cinedex/core/network/dio_client.dart';
import 'package:noct_cinedex/domain/usecases/get_movie_popular_usecase.dart';

import 'package:noct_cinedex/presentation/get_movie_popular_cubit/get_movie_popular_cubit.dart';

final sl = GetIt.instance;

void setup() {
  // External
  sl.registerLazySingleton(() => DioClient.create());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // DataSources
  sl.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(dio: sl()),
  );

  // Repositories
  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );

  // UseCases
  sl.registerLazySingleton(() => GetMoviePopularUseCase(movieRepository: sl()));

  // Cubits
  sl.registerFactory<GetMoviePopularCubit>(
    () => GetMoviePopularCubit(sl<GetMoviePopularUseCase>()),
  );
}
