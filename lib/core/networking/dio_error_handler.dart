import 'package:dio/dio.dart';

String dioErrorHandler(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return "Connection timeout, please try again.";
    case DioExceptionType.sendTimeout:
      return "Send timeout, please try again.";
    case DioExceptionType.receiveTimeout:
      return "Receive timeout, please try again.";
    case DioExceptionType.badResponse:
      return "Bad response: ${e.response?.statusCode} ${e.response?.statusMessage}";
    case DioExceptionType.cancel:
      return "Request was cancelled.";
    case DioExceptionType.unknown:
      return "No internet connection or unknown error.";
    default:
      return "Something went wrong.";
  }
}
