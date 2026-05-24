import 'package:flutter/material.dart';

import '../../../../core/widgets/app_network_image.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AppNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover);
  }
}
