import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:latech_app/core/app_storage/app_storage.dart';

class DioHelper {
  static final String _baseUrl = "https://student.valuxapps.com/api/";
  static late Dio _dio;

  static void init() {
    HttpOverrides.global = _MyHttpOverrides();
    _dio = Dio()..options.baseUrl = _baseUrl;
  }

  static Future<Response<dynamic>> get(String path) async {
    _dio.options.headers = {
      'lang': 'en',
      if(AppStorage.isLogged)
        'Authorization': AppStorage.userInfo.token
    };
    return await _dio.get(path);
  }

  static Future<Response<dynamic>> post(String path, {var data}) async {
    _dio.options.headers = {
      'lang': 'en',
      if(AppStorage.isLogged)
        'Authorization': AppStorage.userInfo.token
    };
    return await _dio.post(path, data: data);
  }
}


class _MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
