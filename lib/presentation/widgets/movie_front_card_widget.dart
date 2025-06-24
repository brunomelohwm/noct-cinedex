import 'package:flutter/material.dart';
import 'package:noct_cinedex/core/responsive/responsive_config.dart';

Widget buildFrontCard(String imageUrl, ResponsiveConfig config) {
  return AspectRatio(
    aspectRatio: 3 / 5,
    child: Card(
      key: const ValueKey('front'),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(config.borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(config.borderRadius),
        child: Image.network(imageUrl, fit: BoxFit.fill),
      ),
    ),
  );
}
