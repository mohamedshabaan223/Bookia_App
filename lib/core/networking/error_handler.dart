import 'package:dio/dio.dart';

class ErrorHandler {
  static String handelErorr(dynamic error){
   if ( error is DioException){
    switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return 'Connection timed out. Please try again.';

    case DioExceptionType.sendTimeout:
      return 'Request timeout. Please try again.';

    case DioExceptionType.receiveTimeout:
      return 'Server took too long to respond.';

    case DioExceptionType.badCertificate:
      return 'Invalid certificate. Connection not secure.';

    case DioExceptionType.badResponse:
      final statusCode = error.response?.statusCode;
      switch (statusCode) {
        case 400:
          return 'Bad request.';
        case 401:
          return 'Unauthorized.';
        case 403:
          return 'Forbidden.';
        case 404:
          return 'Resource not found.';
        case 500:
          return 'Internal server error.';
        default:
          return 'Received invalid status: $statusCode';
      }

    case DioExceptionType.cancel:
      return 'Request was cancelled.';

    case DioExceptionType.connectionError:
      return 'No internet connection.';

    case DioExceptionType.unknown:
      return 'Unexpected error occurred.';
  }
   }
   return error.toString();
  }
}