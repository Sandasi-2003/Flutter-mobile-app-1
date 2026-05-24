import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  final String imageUrl;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final Widget image = imageUrl.startsWith('assets/')
        ? Image.asset(imageUrl, fit: fit)
        : Image.network(
            imageUrl,
            fit: fit,
            errorBuilder: (_, _, _) =>
                Image.asset(AppAssets.placeholder, fit: fit),
          );

    if (borderRadius == null) return image;

    return ClipRRect(borderRadius: borderRadius!, child: image);
  }
}
