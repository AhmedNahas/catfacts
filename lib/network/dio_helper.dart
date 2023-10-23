import 'dart:io';

import 'package:catfacts/constants/api_endpoint.dart';
import 'package:catfacts/constants/constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    if (dio != null) {
      return;
    } else {
      dio = Dio(
        BaseOptions(
          baseUrl: Constants.baseUrl,
          receiveDataWhenStatusError: true,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        ),
      );
    }
  }

  static Future<Response?> getRandomFacts() async {
    return await dio?.get(ApiEndpoint.getRandomFacts,
        queryParameters: {"animal_type": "cat", "amount": "30"});
  }
}
