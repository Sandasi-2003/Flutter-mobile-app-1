import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_storage_keys.dart';
import '../utils/utils.dart';

class LocalStorageService {
  LocalStorageService._();

  static final LocalStorageService instance = LocalStorageService._();

  SharedPreferences? _preferences;

  bool get isInitialized => _preferences != null;

  Future<void> init() async {
    if (_preferences != null) return;

    try {
      _preferences = await SharedPreferences.getInstance();
    } catch (error, stackTrace) {
      AppLogger.error(
        'Failed to initialize LocalStorageService',
        error: error,
        stackTrace: stackTrace,
      );

      rethrow;
    }
  }

  SharedPreferences get _storage {
    final SharedPreferences? preferences = _preferences;

    if (preferences == null) {
      throw StateError(
        'LocalStorageService is not initialized. '
        'Call LocalStorageService.instance.init() before using it.',
      );
    }

    return preferences;
  }

  Future<bool> setString(String key, String value) {
    return _storage.setString(key, value);
  }

  String? getString(String key) {
    return _storage.getString(key);
  }

  Future<bool> setBool(String key, bool value) {
    return _storage.setBool(key, value);
  }

  bool? getBool(String key) {
    return _storage.getBool(key);
  }

  Future<bool> setInt(String key, int value) {
    return _storage.setInt(key, value);
  }

  int? getInt(String key) {
    return _storage.getInt(key);
  }

  Future<bool> setDouble(String key, double value) {
    return _storage.setDouble(key, value);
  }

  double? getDouble(String key) {
    return _storage.getDouble(key);
  }

  Future<bool> setStringList(String key, List<String> value) {
    return _storage.setStringList(key, value);
  }

  List<String> getStringList(String key) {
    return _storage.getStringList(key) ?? <String>[];
  }

  bool containsKey(String key) {
    return _storage.containsKey(key);
  }

  Future<bool> remove(String key) {
    return _storage.remove(key);
  }

  Future<bool> clear() {
    return _storage.clear();
  }

  Future<void> reload() {
    return _storage.reload();
  }

  // Convenience helpers

  // Convenience helpers

  Future<bool> setThemeMode(String themeMode) {
    return setString(AppStorageKeys.themeMode, themeMode);
  }

  String? getThemeMode() {
    return getString(AppStorageKeys.themeMode);
  }

  Future<bool> setOnboardingCompleted(bool value) {
    return setBool(AppStorageKeys.hasCompletedOnboarding, value);
  }

  bool hasCompletedOnboarding() {
    return getBool(AppStorageKeys.hasCompletedOnboarding) ?? false;
  }

  Future<bool> saveRecentSearches(List<String> searches) {
    return setStringList(AppStorageKeys.recentSearches, searches);
  }

  List<String> getRecentSearches() {
    return getStringList(AppStorageKeys.recentSearches);
  }
}
