import 'package:noct_cinedex/core/responsive/screen_type.dart';

class ResponsiveAppBar {
  static double toolbarHeight(ScreenType type) {
    switch (type) {
      case ScreenType.mobile:
        return 56;
      case ScreenType.tablet:
        return 72;
      case ScreenType.totem:
        return 110;
    }
  }
}
