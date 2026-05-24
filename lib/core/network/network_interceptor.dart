import 'package:dio/dio.dart';

import '../utils/utils.dart';

class NetworkInterceptor extends Interceptor {
  NetworkInterceptor({required this.enableLogging});

  final bool enableLogging;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (enableLogging) {
      AppLogger.debug('${options.method} ${options.uri}');
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (enableLogging) {
      AppLogger.debug('${response.statusCode} ${response.requestOptions.uri}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.error(
      'Network error: ${err.requestOptions.uri}',
      error: err.message,
      stackTrace: err.stackTrace,
    );
    handler.next(err);
  }
}
