import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioManager {
  late Dio dio;

  static const String _baseUrl = 'http://tozlukitabım.com/';

  DioManager() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
      ),
    );

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }
}
