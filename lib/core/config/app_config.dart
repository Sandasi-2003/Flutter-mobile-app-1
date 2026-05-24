import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../utils/utils.dart';
import 'environment.dart';

class AppConfig {
  AppConfig._();

  static final AppConfig instance = AppConfig._();

  late final AppEnvironment environment;

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  String get appName => _getString('APP_NAME', fallback: 'E-Commerce App');

  String get baseUrl => _getString('BASE_URL');

  String get apiVersion => _getString('API_VERSION', fallback: '/api/v1');

  String get apiBaseUrl => '$baseUrl$apiVersion';

  int get connectTimeout => _getInt('CONNECT_TIMEOUT', fallback: 30000);

  int get receiveTimeout => _getInt('RECEIVE_TIMEOUT', fallback: 30000);

  int get sendTimeout => _getInt('SEND_TIMEOUT', fallback: 30000);

  bool get enableLogging {
    if (environment.isProduction) return false;

    return _getBool('ENABLE_LOGGING', fallback: true);
  }

  String get currencyCode => _getString('CURRENCY_CODE', fallback: 'LKR');

  String get currencySymbol => _getString('CURRENCY_SYMBOL', fallback: 'Rs.');

  bool get isDevelopment => environment.isDevelopment;

  bool get isStaging => environment.isStaging;

  bool get isProduction => environment.isProduction;

  Future<void> init() async {
    if (_isInitialized) return;

    environment = EnvironmentConfig.current;

    try {
      await dotenv.load(fileName: environment.fileName);

      _validateRequiredValues();

      _isInitialized = true;

      AppLogger.info(
        'AppConfig initialized for ${environment.name} environment',
      );
    } catch (error, stackTrace) {
      AppLogger.error(
        'Failed to initialize AppConfig',
        error: error,
        stackTrace: stackTrace,
      );

      rethrow;
    }
  }

  void _validateRequiredValues() {
    final List<String> requiredKeys = <String>['BASE_URL'];

    for (final String key in requiredKeys) {
      final String? value = dotenv.env[key];

      if (value == null || value.trim().isEmpty) {
        throw StateError('Missing required environment variable: $key');
      }
    }
  }

  String _getString(String key, {String fallback = ''}) {
    return dotenv.env[key] ?? fallback;
  }

  int _getInt(String key, {required int fallback}) {
    final String? value = dotenv.env[key];

    if (value == null || value.trim().isEmpty) {
      return fallback;
    }

    return int.tryParse(value) ?? fallback;
  }

  bool _getBool(String key, {required bool fallback}) {
    final String? value = dotenv.env[key];

    if (value == null || value.trim().isEmpty) {
      return fallback;
    }

    return value.toLowerCase() == 'true' || value == '1';
  }
}
