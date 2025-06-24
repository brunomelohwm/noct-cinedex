import 'package:go_router/go_router.dart';
import 'package:noct_cinedex/core/enums/route_enums.dart';
import 'package:noct_cinedex/presentation/pages/home_page.dart';
import 'package:noct_cinedex/presentation/pages/login_page.dart';
import 'package:noct_cinedex/presentation/pages/movie_details_page.dart';
import 'package:noct_cinedex/presentation/pages/splash_page.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutesEnum.splash.path,

  routes: [
    GoRoute(
      path: RoutesEnum.splash.path,
      name: RoutesEnum.splash.name,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: RoutesEnum.login.path,
      name: RoutesEnum.login.name,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RoutesEnum.home.path,
      name: RoutesEnum.home.name,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: RoutesEnum.movieDetails.path,
      name: RoutesEnum.movieDetails.name,
      builder: (context, state) => const MovieDetailsPage(),
    ),
  ],
);
