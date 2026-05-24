import 'package:flutter/material.dart';

import '../core/constants/constants.dart';
import '../core/services/local_storage_service.dart';
import '../core/utils/utils.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  bool _isInitialized = false;

  ThemeMode get themeMode => _themeMode;

  bool get isInitialized => _isInitialized;

  bool get isSystemMode => _themeMode == ThemeMode.system;

  bool get isLightMode => _themeMode == ThemeMode.light;

  bool get isDarkModeSelected => _themeMode == ThemeMode.dark;

  Future<void> loadTheme() async {
    try {
      final String? savedTheme = LocalStorageService.instance.getString(
        AppStorageKeys.themeMode,
      );

      _themeMode = _themeModeFromString(savedTheme);
    } catch (error, stackTrace) {
      AppLogger.error(
        'Failed to load theme mode',
        error: error,
        stackTrace: stackTrace,
      );

      _themeMode = ThemeMode.system;
    }

    _isInitialized = true;
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;

    _themeMode = mode;
    notifyListeners();

    try {
      await LocalStorageService.instance.setString(
        AppStorageKeys.themeMode,
        _themeModeToString(mode),
      );
    } catch (error, stackTrace) {
      AppLogger.error(
        'Failed to save theme mode',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> setLightTheme() async {
    await setThemeMode(ThemeMode.light);
  }

  Future<void> setDarkTheme() async {
    await setThemeMode(ThemeMode.dark);
  }

  Future<void> setSystemTheme() async {
    await setThemeMode(ThemeMode.system);
  }

  Future<void> toggleTheme(BuildContext context) async {
    final bool currentlyDark = isDarkMode(context);

    if (currentlyDark) {
      await setThemeMode(ThemeMode.light);
    } else {
      await setThemeMode(ThemeMode.dark);
    }
  }

  bool isDarkMode(BuildContext context) {
    if (_themeMode == ThemeMode.system) {
      return MediaQuery.of(context).platformBrightness == Brightness.dark;
    }

    return _themeMode == ThemeMode.dark;
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  ThemeMode _themeModeFromString(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }
}
