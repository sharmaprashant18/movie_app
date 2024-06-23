import 'package:movieapp/models/movie.dart';

class MovieState {
  final bool isLoading;
  final List<Movie> movies;
  final String error;
  final String apiPath;
  final int page;
  final bool loadMore;

  MovieState(
      {required this.error,
      required this.movies,
      required this.isLoading,
      required this.apiPath,
      required this.page,
      required this.loadMore});

  MovieState instances(
      {required MovieState movieState,
      bool? isLoading,
      String? error,
      List<Movie>? movies,
      String? apiPath,
      int? page,
      bool? loadMore}) {
    return MovieState(
        error: error ?? movieState.error,
        movies: movies ?? movieState.movies,
        isLoading: isLoading ?? movieState.isLoading,
        apiPath: movieState.apiPath,
        page: page ?? movieState.page,
        loadMore: loadMore ?? movieState.loadMore);
  }
}
