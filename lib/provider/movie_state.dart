import 'package:movieapp/models/movie.dart';

class MovieState {
  final bool isLoading;
  final List<Movie> movies;
  final String error;

  MovieState(
      {required this.error, required this.movies, required this.isLoading});

  MovieState instances(MovieState movieState, bool? isLoading, String? error) {
    return MovieState(
        error: error ?? movieState.error,
        movies: movieState.movies,
        isLoading: isLoading ?? movieState.isLoading);
  }
}
