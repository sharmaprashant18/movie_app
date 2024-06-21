import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/api.dart';
import 'package:movieapp/provider/movie_state.dart';
import 'package:movieapp/services/movie_service.dart';

final nowPlaying = StateNotifierProvider<NowplayingProvider, MovieState>(
    (ref) => NowplayingProvider(MovieState(
        error: '',
        movies: [],
        isLoading: false,
        apiPath: Api.nowPlaying,
        page: 1)));

class NowplayingProvider extends StateNotifier<MovieState> {
  NowplayingProvider(super.state) {
    getData();
  }
  Future<void> getData() async {
    state = state.instances(movieState: state, isLoading: true);
    final response = await MovieService.getMovieByCategory(
        apiPath: state.apiPath, page: state.page);
    response.fold((l) {
      state = state.instances(
          movieState: state, error: 'Oops! Error Occured', isLoading: false);
    }, (r) {
      state = state.instances(
          movieState: state, movies: r, error: '', isLoading: false);
    });
  }
}
