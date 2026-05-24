import 'package:dio/dio.dart';

import '../config/app_config.dart';
import 'network_interceptor.dart';

class ApiClient {
  ApiClient._();

  static final ApiClient instance = ApiClient._();

  late final Dio dio;
  bool _isInitialized = false;

  void init() {
    if (_isInitialized) return;

    final AppConfig config = AppConfig.instance;

    dio = Dio(
      BaseOptions(
        baseUrl: config.apiBaseUrl,
        connectTimeout: Duration(milliseconds: config.connectTimeout),
        receiveTimeout: Duration(milliseconds: config.receiveTimeout),
        sendTimeout: Duration(milliseconds: config.sendTimeout),
        responseType: ResponseType.json,
        headers: const {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      NetworkInterceptor(enableLogging: config.enableLogging),
    );
    _isInitialized = true;
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (error) {
      if (!_shouldRetry(error)) rethrow;

      return dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    }
  }

  bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError;
  }
}
