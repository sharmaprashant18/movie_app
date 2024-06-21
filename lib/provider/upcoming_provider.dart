import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/api.dart';
import 'package:movieapp/provider/movie_state.dart';
import 'package:movieapp/services/movie_service.dart';

final upComingProvider = StateNotifierProvider<UpcomingProvider, MovieState>(
    (ref) => UpcomingProvider(MovieState(
        error: '',
        movies: [],
        isLoading: false,
        apiPath: Api.upcomingMovie,
        page: 1)));

class UpcomingProvider extends StateNotifier<MovieState> {
  UpcomingProvider(super.state) {
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
          movieState: state, error: '', isLoading: false, movies: r);
    });
  }
}
