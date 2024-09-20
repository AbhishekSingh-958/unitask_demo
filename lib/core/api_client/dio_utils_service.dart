import 'package:dio/dio.dart';

class DioUtil {
  Dio? _instance;
  Dio? getInstance() {
    _instance ??= createDioInstance();
    return _instance;
  }

  Dio createDioInstance() {
    var dio = Dio();
    dio.interceptors.clear();
    return dio;
  }
}
