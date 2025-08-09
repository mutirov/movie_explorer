class ApiConstants {
  static const String apiKey = 'c64448be0c82a7854c0f652261982ebc';
  static const String baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String baseTvUrl = 'https://api.themoviedb.org/3/tv';

  // Movie URLs
  static String popularUrl =
      '$baseUrl/popular?api_key=$apiKey&language=en-US&page=1';
  static String topRatedUrl =
      '$baseUrl/top_rated?api_key=$apiKey&language=en-US&page=1';
  static String upcomingUrl =
      '$baseUrl/upcoming?api_key=$apiKey&language=en-US&page=1';
  static String nowPlayingUrl =
      '$baseUrl/now_playing?api_key=$apiKey&language=en-US&page=1';

  // TV URLs
  static String popularTvUrl =
      '$baseTvUrl/popular?api_key=$apiKey&language=en-US&page=1';
  static String topRatedTvUrl =
      '$baseTvUrl/top_rated?api_key=$apiKey&language=en-US&page=1';
  static String airingTodayTvUrl =
      '$baseTvUrl/airing_today?api_key=$apiKey&language=en-US&page=1';
  static String onTheAirTvUrl =
      '$baseTvUrl/on_the_air?api_key=$apiKey&language=en-US&page=1';

  // Movie Trailer
  static String movieTrailerUrl(int movieId) =>
      '$baseUrl/$movieId/videos?api_key=$apiKey&language=en-US';

  // Movie Detail
  static String movieDetailUrl(int movieId) =>
      '$baseUrl/$movieId?api_key=$apiKey&language=en-US';

  // TV Detail
  static String tvDetailUrl(int tvId) =>
      '$baseTvUrl/$tvId?api_key=$apiKey&language=en-US';

  // TV Trailer
  static String tvTrailerUrl(int tvId) =>
      '$baseTvUrl/$tvId/videos?api_key=$apiKey&language=en-US';
}
