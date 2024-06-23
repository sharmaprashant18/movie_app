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
        page: 1,
        loadMore: false)));

class SearchProvider extends StateNotifier<MovieState> {
  SearchProvider(super.state);
  Future<void> getData({required searchText}) async {
    state = state.instances(
        movieState: state, isLoading: state.loadMore ? false : true);
    final response = await MovieService.getSearchMovie(
        apiPath: state.apiPath, queryText: searchText);
    response.fold((l) {
      state = state.instances(movieState: state, isLoading: false);
    }, (r) {
      state = state.instances(
          movieState: state,
          error: '',
          movies: [...state.movies, ...r],
          isLoading: false);
    });
  }

  void loadMore() {
    state = state.instances(
        movieState: state, page: state.page + 1, loadMore: true);
    getData(searchText: null);
  }
}
