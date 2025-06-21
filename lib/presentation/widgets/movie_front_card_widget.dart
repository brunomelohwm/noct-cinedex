import 'package:flutter/material.dart';

Widget buildFrontCard(String imageUrl) {
  return Card(
    key: const ValueKey('front'),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(imageUrl, height: 300, width: 200, fit: BoxFit.fill),
    ),
  );
}
