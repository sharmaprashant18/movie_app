import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/api.dart';
import 'package:movieapp/provider/movie_state.dart';
import 'package:movieapp/services/movie_service.dart';

final popularProvider = StateNotifierProvider<PopularProvider, MovieState>(
    (ref) => PopularProvider(MovieState(
        error: '',
        movies: [],
        isLoading: false,
        apiPath: Api.popularMovie,
        page: 1)));

class PopularProvider extends StateNotifier<MovieState> {
  PopularProvider(super.state) {
    getData();
  }

  Future<void> getData() async {
    state = state.instances(movieState: state, isLoading: true);
    final response = await MovieService.getMovieByCategory(
        apiPath: state.apiPath, page: state.page);
    response.fold((l) {
      // left for the error and right for the success
      state = state.instances(movieState: state, error: l, isLoading: false);
    }, (r) {
      state = state.instances(
          movieState: state, error: '', movies: r, isLoading: false);
    });
  }
}
