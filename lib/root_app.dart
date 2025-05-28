import 'package:flutter/material.dart';
import 'package:noct_cinedex/presentation/pages/home_page.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noct Cinedex',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
