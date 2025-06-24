import 'package:flutter/material.dart';
import 'package:noct_cinedex/core/responsive/responsive_breakpoints.dart';

import 'package:noct_cinedex/core/responsive/screen_type.dart';

typedef ResponsiveWidgetBuilder =
    Widget Function(BuildContext context, ScreenType screenType);

class ResponsiveBuilder extends StatelessWidget {
  final ResponsiveWidgetBuilder builder;

  const ResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final screenType = ResponsiveBreakpoints.of(context);
    return builder(context, screenType);
  }
}
