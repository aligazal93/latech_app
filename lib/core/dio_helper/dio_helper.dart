import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static final String _baseUrl = "https://student.valuxapps.com/api/";
  static late Dio _dio;

  static void init() {
    _dio = Dio()..options.baseUrl = _baseUrl;
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  static Future<Response<dynamic>> get(String path) async {
    return await _dio.get(path);
  }

  static Future<Response<dynamic>> post(String path, {var data}) async {
    return await _dio.post(path, data: data);
  }
}
