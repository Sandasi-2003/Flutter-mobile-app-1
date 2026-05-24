class AppDurations {
  AppDurations._();

  static const Duration instant = Duration(milliseconds: 0);

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);

  static const Duration splashDelay = Duration(seconds: 2);
  static const Duration snackbar = Duration(seconds: 3);
  static const Duration debounce = Duration(milliseconds: 500);
}
