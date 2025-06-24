import 'package:noct_cinedex/core/responsive/screen_type.dart';

class ResponsiveConfig {
  final int crossAxisCount;
  final double mainAxisExtent;
  final double maxCrossAxisExtent;
  final double cardHeight;
  final double cardWidth;
  final double spacing;
  final double borderRadius;
  final double gridPadding;

  const ResponsiveConfig({
    required this.crossAxisCount,
    required this.mainAxisExtent,
    required this.maxCrossAxisExtent,
    required this.cardHeight,
    required this.cardWidth,
    required this.spacing,
    required this.borderRadius,
    required this.gridPadding,
  });

  static ResponsiveConfig of(ScreenType type) {
    switch (type) {
      case ScreenType.mobile:
        return const ResponsiveConfig(
          crossAxisCount: 2,
          mainAxisExtent: 300,
          maxCrossAxisExtent: 180,
          cardWidth: 150,
          cardHeight: 250,
          spacing: 6,
          borderRadius: 8,
          gridPadding: 8,
        );
      case ScreenType.tablet:
        return const ResponsiveConfig(
          crossAxisCount: 2,
          mainAxisExtent: 350,
          maxCrossAxisExtent: 250,
          cardWidth: 180,
          cardHeight: 300,
          spacing: 12,
          borderRadius: 12,
          gridPadding: 24,
        );
      case ScreenType.totem:
        return const ResponsiveConfig(
          crossAxisCount: 2,
          mainAxisExtent: 500,
          maxCrossAxisExtent: 360,
          cardWidth: 300,
          cardHeight: 500,
          spacing: 80,
          borderRadius: 24,
          gridPadding: 60,
        );
    }
  }
}
