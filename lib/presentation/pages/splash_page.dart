import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      // ignore: use_build_context_synchronously
      context.go('/home');
    });
    return const Scaffold(body: Center(child: Text('Splash...')));
  }
}
