import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noct_cinedex/core/usecase/usecase.dart';
import 'package:noct_cinedex/domain/usecases/get_movie_popular_usecase.dart';

import 'package:noct_cinedex/presentation/get_movie_popular_cubit/get_movie_popular_state.dart';

class GetMoviePopularCubit extends Cubit<GetMoviePopularState> {
  final GetMoviePopularUseCase getMoviePopularUseCase;

  GetMoviePopularCubit(this.getMoviePopularUseCase)
    : super(GetMoviePopularInitial());

  Future<void> fetchMoviePopular() async {
    emit(GetMoviePopularLoading());

    final result = await getMoviePopularUseCase(params: const NoParams());

    result.fold(
      (failure) => emit(GetMoviePopularError(message: "falha de conexão")),
      (movies) => emit(GetMoviePopularLoaded(movies: movies)),
    );
  }
}
