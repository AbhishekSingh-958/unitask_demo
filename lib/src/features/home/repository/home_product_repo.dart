import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:unitask_demo/core/route/api_route.dart';

class HomeProductRepository {
  final Dio dio;
  HomeProductRepository({required this.dio});

  Future fetchAllProducts() async {
    String path = ApiUrl.getProducts;
    try {
      final response = await dio.get(path);
      log(response.data.toString());
      switch (response.statusCode) {
        case 200:
          return response.data;
        default:
          throw Exception('Something Went Wrong');
      }
    } catch (e) {
      log('error in api $e');
      rethrow;
    }
  }

  Future fetchAllProductCategories() async {
    String path = ApiUrl.productCategories;
    try {
      final response = await dio.get(path);
      log(response.data.toString());
      switch (response.statusCode) {
        case 200:
          return response.data;
        default:
          throw Exception('Something Went Wrong');
      }
    } catch (e) {
      log('error in api $e');
      rethrow;
    }
  }
}
