import 'package:dio/dio.dart';
import 'package:noct_cinedex/core/config/api_keys.dart';
import 'package:noct_cinedex/core/network/api_key_interceptor.dart';
import 'package:noct_cinedex/core/network/api_urls.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiUrls.baseApiUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    )..interceptors.add(ApiKeyInterceptor(tmdbApiKey));

    return dio;
  }
}
