import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:movieapp/api.dart';
import 'package:movieapp/provider/movie_state.dart';
import 'package:movieapp/services/movie_service.dart';

final latest = StateNotifierProvider<LatestProvider, MovieState>((ref) =>
    LatestProvider(MovieState(
        error: '',
        movies: [],
        isLoading: false,
        apiPath: Api.latestMovie,
        page: 1)));

class LatestProvider extends StateNotifier<MovieState> {
  LatestProvider(super.state) {
    getData();
  }
  Future<void> getData() async {
    state = state.instances(movieState: state, isLoading: true);

    final response = await MovieService.getLatestMovie(
      apiPath: state.apiPath,
    );
    response.fold((l) {
      state = state.instances(movieState: state, error: l, isLoading: F);
    }, (r) {
      state = state.instances(
          movieState: state, error: '', isLoading: false, movies: [r]);
    });
  }
}
