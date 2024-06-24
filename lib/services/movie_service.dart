import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/models/video.dart';

class MovieService {
  static Dio dio = Dio();
  static Future<Either<String, List<Movie>>> getMovieByCategory(
      {required String apiPath, required int page}) async {
    try {
      //value must be sent in map i.e key name and value in the queryparameters
      final response = await dio.get(apiPath, queryParameters: {
        'api_key': 'f370a118f8c9551e6f47b9193d032054',
        'page': page
      });
      final newData = (response.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
      return Right(newData);
    } on DioException catch (err) {
      return Left(err.message as String);
    }
  }

  static Future<Either<String, Movie>> getLatestMovie(
      {required String apiPath}) async {
    try {
      //value must be sent in map i.e key name and value in the queryparameters
      final response = await dio.get(apiPath, queryParameters: {
        'api_key': 'f370a118f8c9551e6f47b9193d032054',
      });
      final newData = Movie.fromJson(response.data);

      return Right(newData);
    } on DioException catch (err) {
      return Left(err.message as String);
    }
  }

  static Future<Either<String, List<Movie>>> getSearchMovie(
      {required String apiPath, required String queryText}) async {
    try {
      final response = await dio.get(apiPath, queryParameters: {
        'api_key': 'f370a118f8c9551e6f47b9193d032054',
        'query': queryText
      });
      final newData = (response.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
      return Right(newData);
    } on DioException catch (err) {
      return Left(err.message as String);
    }
  }

  static Future<List<Video>> getVideoKey({required int movieId}) async {
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/movie/$movieId/videos',
          queryParameters: {
            'api_key': 'f370a118f8c9551e6f47b9193d032054',
          });
      final newData = (response.data['results'] as List)
          .map((e) => Video.fromJson(e))
          .toList();
      return newData;
    } on DioException catch (err) {
      throw err.message as String;
    }
  }
}

final videoProvider = FutureProvider.family(
    (ref, int movieId) => MovieService.getVideoKey(movieId: movieId));
