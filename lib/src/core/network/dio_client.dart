import 'dart:developer';

import 'package:dio/dio.dart';

final class DioConfig {
  static const timeoutDefault = Duration(seconds: 15);

  static Dio configureDioClient() {
    return Dio()
      ..options.responseType = ResponseType.json
      ..options.sendTimeout = timeoutDefault
      ..options.receiveTimeout = timeoutDefault
      ..options.connectTimeout = timeoutDefault
      ..interceptors.add(NetworkLogInterceptor());
  }
}

class NetworkLogInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    log('REQUEST: ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    log(
      'RESPONSE: ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      log(
        'Request timeout',
        error: err,
        stackTrace: err.stackTrace,
      );
    } else if (err.type == DioExceptionType.badResponse) {
      log(
        'HTTP error: ${err.response?.statusCode}',
        error: err,
        stackTrace: err.stackTrace,
      );
    } else if (err.type == DioExceptionType.cancel) {
      log(
        'Request canceled',
        error: err,
        stackTrace: err.stackTrace,
      );
    } else {
      log(
        'Network error',
        error: err,
        stackTrace: err.stackTrace,
      );
    }
    handler.next(err);
  }
}
