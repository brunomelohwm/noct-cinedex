import 'package:flutter/material.dart';
import 'package:noct_cinedex/domain/entities/movies/movie_entity.dart';
import 'package:noct_cinedex/presentation/widgets/movie_list_item.widget.dart';

class MovieGridView extends StatelessWidget {
  final List<MovieEntity> movies;
  const MovieGridView({required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 300,
      ),
      itemCount: movies.length,
      itemBuilder: (_, int index) {
        return MovieListItem(movie: movies[index]);
      },
    );
  }
}
