import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/api.dart';
import 'package:movieapp/provider/movie_state.dart';
import 'package:movieapp/services/movie_service.dart';

final search = StateNotifierProvider.autoDispose<SearchProvider, MovieState>(
    (ref) => SearchProvider(MovieState(
        error: '',
        movies: [],
        isLoading: false,
        apiPath: Api.searchMovie,
        page: 1)));

class SearchProvider extends StateNotifier<MovieState> {
  SearchProvider(super.state);
  Future<void> getData({required searchText}) async {
    state = state.instances(movieState: state, isLoading: true);
    final response = await MovieService.getSearchMovie(
        apiPath: state.apiPath, queryText: searchText);
    response.fold((l) {
      state = state.instances(movieState: state, isLoading: false);
    }, (r) {
      state = state.instances(
          movieState: state, error: '', movies: r, isLoading: false);
    });
  }
}
