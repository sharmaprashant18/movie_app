import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/models/movie.dart';

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
}
