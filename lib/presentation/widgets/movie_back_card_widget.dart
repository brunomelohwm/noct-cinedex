import 'package:flutter/material.dart';
import 'package:noct_cinedex/core/responsive/responsive_text_style.dart';
import 'package:noct_cinedex/core/responsive/screen_type.dart';
import 'package:noct_cinedex/domain/entities/movies/movie_entity.dart';

class MovieBackCard extends StatelessWidget {
  final MovieEntity movie;
  final String imageUrl;
  final ScreenType screenType;

  const MovieBackCard({
    super.key,
    required this.movie,
    required this.imageUrl,
    required this.screenType,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 5,
      child: Card(
        key: const ValueKey('back'),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Positioned.fill(child: Image.network(imageUrl, fit: BoxFit.fill)),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.8),
                      Colors.black.withValues(alpha: 0.2),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: ResponsiveTextStyle.cardSinopse(screenType),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            movie.overview.isNotEmpty
                                ? movie.overview
                                : "Sinopse não disponível",
                            style: ResponsiveTextStyle.cardSinopse(screenType),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
