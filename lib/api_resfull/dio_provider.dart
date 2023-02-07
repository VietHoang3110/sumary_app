// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart' show Dio, LogInterceptor;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sumary_app/src/src_index.dart';

class DioProvider {
  static final Dio _dio = Dio();
  static Dio instance({String? token}) {
    _dio
      ..options.baseUrl = dotenv.env[PreferencesKey.BASE_URL]!
      ..options.connectTimeout = BASE_URL.connectionTimeout
      ..options.receiveTimeout = BASE_URL.receiveTimeout
      ..options.headers = {
        // BASE_URL.content_type: BASE_URL.application_json,
        // BASE_URL.auth_type: "Bearer $token",
        BASE_URL.token : token,
      }
      ..options.followRedirects = false
      ..options.validateStatus = (status ){ return status! < 503;}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ));
    return _dio;
  }
}
