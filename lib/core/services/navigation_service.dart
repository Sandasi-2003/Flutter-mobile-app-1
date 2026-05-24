import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._();

  static final NavigationService instance = NavigationService._();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get navigator => navigatorKey.currentState;

  BuildContext? get context => navigatorKey.currentContext;

  Future<T?>? pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigator?.pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?>? pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigator?.pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  Future<T?>? pushNamedAndRemoveUntil<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigator?.pushNamedAndRemoveUntil<T>(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void pop<T extends Object?>([T? result]) {
    if (canPop()) {
      navigator?.pop<T>(result);
    }
  }

  bool canPop() {
    return navigator?.canPop() ?? false;
  }

  void popUntil(String routeName) {
    navigator?.popUntil(ModalRoute.withName(routeName));
  }
}
