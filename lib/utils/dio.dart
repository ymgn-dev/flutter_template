import 'dart:developer';

import 'package:dio/dio.dart';

final dio = Dio()..interceptors.add(_DioInterceptor());

// NOTE: https://github.com/bizz84/tmdb_movie_app_riverpod/blob/main/lib/src/utils/logger_interceptor.dart
class _DioInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('❌ Dio Error!');
    log('❌ Url: ${err.requestOptions.uri}');
    if (err.stackTrace != null) {
      log('❌ ${err.stackTrace}');
    }
    log('❌ Response Error: ${err.response?.data}');
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('🌍 Sending network request: ${options.baseUrl}${options.path}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('⬅️ Received network response');
    log('${response.statusCode != 200 ? '❌ ${response.statusCode} ❌' : '✅ 200 ✅'} ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    log('Query params: ${response.requestOptions.queryParameters}');
    log('-------------------------');
    return handler.next(response);
  }
}
