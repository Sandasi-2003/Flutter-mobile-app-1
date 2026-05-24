import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';

class AppSvgIcon extends StatelessWidget {
  const AppSvgIcon(
    this.asset, {
    super.key,
    this.size = AppSizes.iconMd,
    this.color,
  });

  final String asset;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: size,
      height: size,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
