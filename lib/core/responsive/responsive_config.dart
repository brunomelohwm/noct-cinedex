import 'package:noct_cinedex/core/responsive/screen_type.dart';

class ResponsiveConfig {
  final int crossAxisCount;
  final double mainAxisExtent;

  const ResponsiveConfig({
    required this.crossAxisCount,
    required this.mainAxisExtent,
  });

  static ResponsiveConfig of(ScreenType type) {
    switch (type) {
      case ScreenType.mobile:
        return const ResponsiveConfig(crossAxisCount: 2, mainAxisExtent: 300);
      case ScreenType.tablet:
        return const ResponsiveConfig(crossAxisCount: 3, mainAxisExtent: 350);
      case ScreenType.totem:
        return const ResponsiveConfig(crossAxisCount: 4, mainAxisExtent: 400);
    }
  }
}
