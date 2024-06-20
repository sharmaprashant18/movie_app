import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/api.dart';
import 'package:movieapp/provider/movie_state.dart';
import 'package:movieapp/services/movie_service.dart';

final topRatedProvider = StateNotifierProvider<TopratedProvider, MovieState>(
    (ref) => TopratedProvider(MovieState(
        error: '',
        movies: [],
        isLoading: false,
        apiPath: Api.topRatedMovie,
        page: 1)));

class TopratedProvider extends StateNotifier<MovieState> {
  TopratedProvider(super.state) {
    getData();
  }

  Future<void> getData() async {
    state = state.instances(movieState: state, isLoading: true);
    final response = await MovieService.getMovieByCategory(
        apiPath: state.apiPath, page: state.page);

    response.fold((l) {
      state = state.instances(movieState: state, error: l, isLoading: false);
    }, (r) {
      state = state.instances(
          movieState: state, movies: r, isLoading: false, error: '');
    });
  }
}
