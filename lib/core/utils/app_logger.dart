import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  AppLogger._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static void debug(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      _logger.d(message, error: error, stackTrace: stackTrace);
    }
  }

  static void info(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      _logger.i(message, error: error, stackTrace: stackTrace);
    }
  }

  static void warning(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      _logger.w(message, error: error, stackTrace: stackTrace);
    }
  }

  static void error(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      _logger.e(message, error: error, stackTrace: stackTrace);
    }
  }

  static void fatal(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      _logger.f(message, error: error, stackTrace: stackTrace);
    }
  }
}
