import 'package:flutter/material.dart';

import '../utils/responsive_utils.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? largeDesktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.largeDesktop,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveUtils.isLargeDesktop(context)) {
      return largeDesktop ?? desktop ?? tablet ?? mobile;
    }

    if (ResponsiveUtils.isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    }

    if (ResponsiveUtils.isTablet(context)) {
      return tablet ?? mobile;
    }

    return mobile;
  }
}
