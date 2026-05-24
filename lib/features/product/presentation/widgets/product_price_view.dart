import 'package:flutter/material.dart';

import '../../../../core/extensions/extensions.dart';

class ProductPriceView extends StatelessWidget {
  const ProductPriceView({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toStringAsFixed(2)}',
      style: context.textTheme.titleSmall?.copyWith(
        color: context.colors.primary,
      ),
    );
  }
}
