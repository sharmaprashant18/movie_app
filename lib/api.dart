class Api {
  static const String baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String popularMovie =
      '$baseUrl/popular'; //static and const is used because it is constant and cannot be changed
  static const String topRatedMovie = '$baseUrl/top_rated';
  static const String upcomingMovie = '$baseUrl/upcoming';
}
