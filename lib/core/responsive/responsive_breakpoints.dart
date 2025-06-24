import 'package:flutter/material.dart';
import 'package:noct_cinedex/core/responsive/screen_type.dart';

class ResponsiveBreakpoints {
  static const double _tabletWidth = 600;
  static const double _totemWidth = 900;

  static ScreenType getType(double width) {
    if (width < _tabletWidth) return ScreenType.mobile;
    if (width < _totemWidth) return ScreenType.tablet;
    return ScreenType.totem;
  }

  static ScreenType of(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return getType(width);
  }
}
