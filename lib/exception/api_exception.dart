// import 'package:dio/dio.dart';

// class DioExcepm {
//   String getDioError(DioException, dioError) {
//     switch (dioError.type) {
//       case DioExceptionType.response:
//         return _handleStatusCode(dioError.response!);
//       case DioExceptionType.other:
//         if (dioError.message.contains('Socket Exception')) {
//           return 'No Internet';
//         } else {
//           return 'Unexpected error occurred';
//         }
//       default:
//         return 'Something went wrong';
//     }
//   }

//   String _handleStatusCode(Response response) {
//     switch (response.statusCode) {
//       case 400:
//         return 'Bad Request';
//       case 401:
//         return 'Authentication Failed';
//       case 403:
//         return 'Forbidden';
//     }
//   }
// }
