class Api {
  static const String baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String popularMovie =
      '$baseUrl/popular'; //static and const is used because it is constant and cannot be changed
  static const String topRatedMovie = '$baseUrl/top_rated';
  static const String upcomingMovie = '$baseUrl/upcoming';
  static const String nowPlaying = '$baseUrl/now_playing';
  static const String latestMovie = '$baseUrl/latest';
}
// https://api.themoviedb.org/3/movie/latest