import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF1C1C1E),
      cardColor: const Color(0xFF2C2C2E),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF2C2C2E),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 24, color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
      dividerColor: Colors.white10,
      colorScheme: const ColorScheme.dark(
        primary: Colors.tealAccent,
        secondary: Colors.teal,
      ),
    );
  }
}
