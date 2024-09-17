import 'package:dio/dio.dart';

import '../helpers/error_model.dart';


class ApiExceptionHandler {
  static String getErrorMessage(Map<String, dynamic>? response) {
    String? errorMessage;
    if (response != null) {
      ///passing error in model and saving error reason
      errorMessage = ErrorResponse.fromJson(response).error?.info;
    }
    return errorMessage ?? 'Something went wrong!';
  }

  static String error(Object exception) {
    String? errorMessage;
    if (exception is DioException) {
      if (exception.error is ApiException) {
        errorMessage = (exception.error as ApiException).errorMessage;
      }
    }
    return errorMessage ?? 'Something went wrong!';
  }
}

class ApiException implements Exception {
  Map<String, dynamic>? response;
  String? errorMessage;
  int? status;

  ApiException({this.response, this.errorMessage, this.status});

  factory ApiException.fromJson(Response? response) => ApiException(
        status: response?.data?['error']?['code'],
        errorMessage: ApiExceptionHandler.getErrorMessage(response?.data),
        response: response?.data,
      );
}
