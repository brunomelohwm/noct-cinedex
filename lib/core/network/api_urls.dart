class ApiUrls {
  static const String popularMoviesPath = '/movie/popular';
  static const String genreListPath = '/genre/movie/list';
  static const String baseApiUrl = 'https://api.themoviedb.org/3';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/';
  static const String imageSizeW500 = 'w500';
  static const String imageSizeOriginal = 'original';

  static String imageUrl(String path, {String size = imageSizeW500}) {
    return '$baseImageUrl$size$path';
  }
}
