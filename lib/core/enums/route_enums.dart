enum RoutesEnum {
  splash(name: 'splash-page', path: '/spash-page'),
  login(name: 'login-page', path: '/login-page'),
  home(name: 'home-page', path: '/home-page'),
  movieDetails(name: 'movie-details-page', path: '/movie-details-page');

  const RoutesEnum({required this.name, required this.path});

  final String name;
  final String path;
}
