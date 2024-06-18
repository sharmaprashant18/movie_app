import 'package:dio/dio.dart';

class MovieService {
  static Dio dio = Dio();
  static Future getMovieByCategory(
      {required String apiPath, required int page}) async {
    try {
      final response = await dio.get(apiPath, queryParameters: {
        'api_key': 'f370a118f8c9551e6f47b9193d032054',
        'page': page
      });
      //value must be sent in map i.e key name and value in the queryparameters
    } on DioException catch (err) {
      print(err.message);
    }
  }
}
