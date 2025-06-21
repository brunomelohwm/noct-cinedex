import 'package:flutter/material.dart';
import 'package:noct_cinedex/core/responsive/responsive_config.dart';
import 'package:noct_cinedex/core/responsive/screen_type.dart';
import 'package:noct_cinedex/domain/entities/movies/movie_entity.dart';
import 'package:noct_cinedex/presentation/widgets/movie_list_item.widget.dart';

class MovieGridView extends StatelessWidget {
  final List<MovieEntity> movies;
  final ScreenType screenType;
  const MovieGridView({
    super.key,
    required this.movies,
    required this.screenType,
  });

  @override
  Widget build(BuildContext context) {
    final config = ResponsiveConfig.of(screenType);
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: config.crossAxisCount,
        mainAxisExtent: config.mainAxisExtent,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: movies.length,
      itemBuilder: (_, int index) {
        return MovieListItem(movie: movies[index]);
      },
    );
  }
}
