import 'package:flutter/material.dart';
import 'package:noct_cinedex/core/responsive/screen_type.dart';

class ResponsiveTextStyle {
  static TextStyle? appBarTitle(ScreenType type) {
    switch (type) {
      case ScreenType.mobile:
        return TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
      case ScreenType.tablet:
        return TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
      case ScreenType.totem:
        return TextStyle(fontSize: 60, fontWeight: FontWeight.bold);
    }
  }

  static TextStyle cardSinopse(ScreenType type) {
    switch (type) {
      case ScreenType.mobile:
        return TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 1.4,
          color: Colors.white,
        );
      case ScreenType.tablet:
        return TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          height: 1.4,
          color: Colors.white,
        );
      case ScreenType.totem:
        return TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.w700,
          height: 1.4,
          color: Colors.white,
        );
    }
  }
}
