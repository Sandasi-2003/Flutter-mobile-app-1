import 'package:flutter/material.dart';

import '../theme/app_theme_extension.dart';

extension ContextExtensions on BuildContext {
  // Theme
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  AppThemeExtension get appColors {
    final AppThemeExtension? extension = theme.extension<AppThemeExtension>();

    assert(
      extension != null,
      'AppThemeExtension is not found in ThemeData.extensions',
    );

    return extension!;
  }

  bool get isDarkMode => theme.brightness == Brightness.dark;

  bool get isLightMode => theme.brightness == Brightness.light;

  // MediaQuery
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;

  double get width => screenSize.width;

  double get height => screenSize.height;

  double get statusBarHeight => mediaQuery.padding.top;

  double get bottomPadding => mediaQuery.padding.bottom;

  EdgeInsets get padding => mediaQuery.padding;

  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  Orientation get orientation => mediaQuery.orientation;

  bool get isPortrait => orientation == Orientation.portrait;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isKeyboardOpen => viewInsets.bottom > 0;

  // Device Type
  bool get isMobile => width < 600;

  bool get isTablet => width >= 600 && width < 1024;

  bool get isDesktop => width >= 1024;

  // Navigation
  NavigatorState get navigator => Navigator.of(this);

  void pop<T extends Object?>([T? result]) {
    navigator.pop(result);
  }

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigator.pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigator.pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigator.pushNamedAndRemoveUntil<T>(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  // Focus
  FocusScopeNode get focusScope => FocusScope.of(this);

  void hideKeyboard() {
    focusScope.unfocus();
  }

  // Snackbar
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(this);

  void showSnackBarMessage(
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message), duration: duration));
  }
}
