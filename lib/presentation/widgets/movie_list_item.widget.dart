import 'package:flutter/material.dart';
import 'package:noct_cinedex/core/network/api_urls.dart';
import 'package:noct_cinedex/core/responsive/responsive_config.dart';
import 'package:noct_cinedex/core/responsive/screen_type.dart';
import 'package:noct_cinedex/domain/entities/movies/movie_entity.dart';
import 'package:noct_cinedex/presentation/widgets/movie_back_card_widget.dart';
import 'package:noct_cinedex/presentation/widgets/movie_front_card_widget.dart';

class MovieListItem extends StatefulWidget {
  final MovieEntity movie;
  final ScreenType screenType;

  const MovieListItem({
    required this.movie,
    required this.screenType,
    super.key,
  });

  @override
  State<MovieListItem> createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  bool _showBack = false;

  void _toggleCard() {
    setState(() {
      _showBack = !_showBack;
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = ApiUrls.imageUrl(widget.movie.posterPath);
    final config = ResponsiveConfig.of(widget.screenType);

    return GestureDetector(
      onTap: _toggleCard,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder:
            (child, animation) =>
                FadeTransition(opacity: animation, child: child),
        child:
            _showBack
                ? MovieBackCard(
                  movie: widget.movie,
                  imageUrl: imageUrl,
                  screenType: widget.screenType,
                )
                : buildFrontCard(imageUrl, config),
      ),
    );
  }
}
