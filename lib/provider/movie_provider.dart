import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:movieapp/api.dart';
import 'package:movieapp/provider/movie_state.dart';
import 'package:movieapp/services/movie_service.dart';

//POPULAR PROVIDER

final popularProvider = StateNotifierProvider<PopularProvider, MovieState>(
    (ref) => PopularProvider(MovieState(
        error: '',
        movies: [],
        isLoading: false,
        apiPath: Api.popularMovie,
        page: 1,
        loadMore: false)));

class PopularProvider extends StateNotifier<MovieState> {
  PopularProvider(super.state) {
    getData();
  }

  Future<void> getData() async {
    state = state.instances(
        movieState: state, isLoading: state.loadMore ? false : true);
    final response = await MovieService.getMovieByCategory(
        apiPath: state.apiPath, page: state.page);
    response.fold((l) {
      // left for the error and right for the success
      state = state.instances(
          movieState: state, error: 'Oops! Error Occured', isLoading: false);
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
    getData();
  }
}

//TOPRATED PROVIDER

final topRatedProvider = StateNotifierProvider<TopratedProvider, MovieState>(
    (ref) => TopratedProvider(MovieState(
        error: '',
        movies: [],
        isLoading: false,
        apiPath: Api.topRatedMovie,
        page: 1,
        loadMore: false)));

class TopratedProvider extends StateNotifier<MovieState> {
  TopratedProvider(super.state) {
    getData();
  }

  Future<void> getData() async {
    state = state.instances(
        movieState: state, isLoading: state.loadMore ? false : true);
    final response = await MovieService.getMovieByCategory(
        apiPath: state.apiPath, page: state.page);

    response.fold((l) {
      state = state.instances(
          movieState: state, error: 'Oops! Error Occured', isLoading: false);
    }, (r) {
      state = state.instances(
          movieState: state,
          movies: [...state.movies, ...r],
          isLoading: false,
          error: '');
    });
  }

  void loadMore() {
    state = state.instances(
        movieState: state, page: state.page + 1, loadMore: true);
    getData();
  }
}

//UPCOMING PROVIDER

final upComingProvider = StateNotifierProvider<UpcomingProvider, MovieState>(
    (ref) => UpcomingProvider(MovieState(
        error: '',
        movies: [],
        isLoading: false,
        apiPath: Api.upcomingMovie,
        page: 1,
        loadMore: false)));

class UpcomingProvider extends StateNotifier<MovieState> {
  UpcomingProvider(super.state) {
    getData();
  }

  Future<void> getData() async {
    state = state.instances(
        movieState: state, isLoading: state.loadMore ? false : true);
    final response = await MovieService.getMovieByCategory(
        apiPath: state.apiPath, page: state.page);
    response.fold((l) {
      state = state.instances(
          movieState: state, error: 'Oops! Error Occured', isLoading: false);
    }, (r) {
      state = state.instances(
          movieState: state,
          error: '',
          isLoading: false,
          movies: [...state.movies, ...r]);
    });
  }

  void loadMore() {
    state = state.instances(
        movieState: state, page: state.page + 1, loadMore: true);
    getData();
  }
}

//NOWPLAYING PROVIDER

final nowPlaying = StateNotifierProvider<NowplayingProvider, MovieState>(
    (ref) => NowplayingProvider(MovieState(
        error: '',
        movies: [],
        isLoading: false,
        apiPath: Api.nowPlaying,
        page: 1,
        loadMore: false)));

class NowplayingProvider extends StateNotifier<MovieState> {
  NowplayingProvider(super.state) {
    getData();
  }
  Future<void> getData() async {
    state = state.instances(
        movieState: state, isLoading: state.loadMore ? false : true);
    final response = await MovieService.getMovieByCategory(
        apiPath: state.apiPath, page: state.page);
    response.fold((l) {
      state = state.instances(
          movieState: state, error: 'Oops! Error Occured', isLoading: false);
    }, (r) {
      state = state.instances(
          movieState: state,
          movies: [...state.movies, ...r],
          error: '',
          isLoading: false);
    });
  }

  void loadMore() {
    state = state.instances(
        movieState: state, page: state.page + 1, loadMore: true);
    getData();
  }
}

//LATEST PROVIDER

final latest = StateNotifierProvider<LatestProvider, MovieState>((ref) =>
    LatestProvider(MovieState(
        error: '',
        movies: [],
        isLoading: false,
        apiPath: Api.latestMovie,
        page: 1,
        loadMore: false)));

class LatestProvider extends StateNotifier<MovieState> {
  LatestProvider(super.state) {
    getData();
  }
  Future<void> getData() async {
    state = state.instances(movieState: state, isLoading: false);

    final response = await MovieService.getLatestMovie(apiPath: state.apiPath);
    response.fold((l) {
      state = state.instances(
          movieState: state, error: 'Oops! Error Occured', isLoading: F);
    }, (r) {
      state = state.instances(
          movieState: state, error: '', isLoading: false, movies: [r]);
    });
  }
}
