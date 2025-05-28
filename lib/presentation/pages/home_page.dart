import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:noct_cinedex/injection_container.dart' as di;
import 'package:noct_cinedex/presentation/get_movie_popular_cubit/get_movie_popular_cubit.dart';

import 'package:noct_cinedex/presentation/get_movie_popular_cubit/get_movie_popular_state.dart';
import 'package:noct_cinedex/presentation/widgets/loding_widget.dart';
import 'package:noct_cinedex/presentation/widgets/movie_grid_view_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<GetMoviePopularCubit>()..fetchMoviePopular(),
      child: Scaffold(
        appBar: AppBar(title: Text('Filmes Populares')),
        body: BlocBuilder<GetMoviePopularCubit, GetMoviePopularState>(
          builder: (context, state) {
            if (state is GetMoviePopularLoading) {
              return LoadingWidget();
            } else if (state is GetMoviePopularLoaded) {
              final movies = state.movies;
              return MovieGridView(movies: movies);
            } else if (state is GetMoviePopularError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
