import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ResponsiveUtils {
  ResponsiveUtils._();

  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  static bool isLargeDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Orientation orientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  static bool isPortrait(BuildContext context) {
    return orientation(context) == Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    return orientation(context) == Orientation.landscape;
  }

  static double responsiveValue({
    required BuildContext context,
    required double mobile,
    double? tablet,
    double? desktop,
    double? largeDesktop,
  }) {
    if (isLargeDesktop(context)) {
      return largeDesktop ?? desktop ?? tablet ?? mobile;
    }

    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    }

    if (isTablet(context)) {
      return tablet ?? mobile;
    }

    return mobile;
  }

  static EdgeInsets pagePadding(BuildContext context) {
    final double horizontal = responsiveValue(
      context: context,
      mobile: AppSpacing.pagePadding,
      tablet: AppSpacing.xl,
      desktop: 64,
      largeDesktop: 96,
    );

    return EdgeInsets.symmetric(horizontal: horizontal);
  }

  static int productGridCrossAxisCount(BuildContext context) {
    final double width = screenWidth(context);

    if (width >= 1200) return 5;
    if (width >= 1024) return 4;
    if (width >= 700) return 3;

    return 2;
  }

  static double productGridChildAspectRatio(BuildContext context) {
    if (isTablet(context)) return 0.72;
    if (isDesktop(context)) return 0.76;

    return 0.68;
  }

  static double maxContentWidth(BuildContext context) {
    if (isLargeDesktop(context)) return 1280;
    if (isDesktop(context)) return 1100;
    if (isTablet(context)) return 900;

    return double.infinity;
  }

  static double productImageHeight(BuildContext context) {
    return responsiveValue(
      context: context,
      mobile: AppSizes.productImageHeight,
      tablet: 220,
      desktop: 260,
    );
  }
}
