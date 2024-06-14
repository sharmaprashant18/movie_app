import 'package:dio/dio.dart';
import 'package:movieapp/api.dart';

class MovieService {
  static Dio dio = Dio();

  static Future movieByCategory(
      {required String apiPath, required int page}) async {
    try {
      await dio.get(apiPath, queryParameters: {
        'api_key': 'f370a118f8c9551e6f47b9193d032054',
        'page': page
      });
    } on DioException catch (error) {
//
//
//
//
//
//
    }
  }
}
