import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:noct_cinedex/core/network/api_key_interceptor.dart';
import 'package:noct_cinedex/core/network/api_urls.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiUrls.baseApiUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        queryParameters: {'language': 'pt-BR'},
      ),
    )..interceptors.add(ApiKeyInterceptor(dotenv.env['TMDB_API_KEY'] ?? ''));

    return dio;
  }
}
