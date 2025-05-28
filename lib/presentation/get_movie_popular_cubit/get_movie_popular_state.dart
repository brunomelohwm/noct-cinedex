import 'package:equatable/equatable.dart';

import 'package:noct_cinedex/domain/entities/movies/movie_entity.dart';

abstract class GetMoviePopularState extends Equatable {
  const GetMoviePopularState();

  @override
  List<Object> get props => [];
}

class GetMoviePopularInitial extends GetMoviePopularState {
  const GetMoviePopularInitial();

  @override
  List<Object> get props => [];
}

class GetMoviePopularLoading extends GetMoviePopularState {
  const GetMoviePopularLoading();

  @override
  List<Object> get props => [];
}

class GetMoviePopularLoaded extends GetMoviePopularState {
  final List<MovieEntity> movies;
  const GetMoviePopularLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}

class GetMoviePopularError extends GetMoviePopularState {
  final String message;
  const GetMoviePopularError({required this.message});
  @override
  List<Object> get props => [message];
}
