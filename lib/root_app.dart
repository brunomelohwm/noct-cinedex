import 'package:flutter/material.dart';
import 'package:noct_cinedex/core/theme/app_theme.dart';
import 'package:noct_cinedex/presentation/pages/home_page.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
      title: 'Noct Cinedex',
      debugShowCheckedModeBanner: false,

      home: const HomePage(),
    );
  }
}
