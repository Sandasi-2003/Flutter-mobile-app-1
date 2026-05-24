import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/models/shop_models.dart';
import '../../../main/presentation/providers/main_provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.compact = false});

  final Product product;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final MainProvider controller = context.watch<MainProvider>();
    final bool isFavorite = controller.isFavorite(product.id);

    return InkWell(
      onTap: () =>
          context.pushNamed(AppRoutes.productDetails, arguments: product.id),
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AppNetworkImage(
                      imageUrl: product.image,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(AppRadius.card),
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppSpacing.sm,
                    right: AppSpacing.sm,
                    child: _CircleIconButton(
                      asset: isFavorite
                          ? AppAssets.iconWishlistFilled
                          : AppAssets.iconWishlist,
                      color: isFavorite
                          ? context.colors.primary
                          : context.colors.onSurface,
                      onPressed: () => controller.toggleFavorite(product.id),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      AppSvgIcon(
                        AppAssets.iconStarFilled,
                        size: 15,
                        color: context.appColors.rating,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        product.rating.toStringAsFixed(1),
                        style: context.textTheme.labelSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.colors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({
    required this.asset,
    required this.onPressed,
    this.color,
  });

  final String asset;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.surface,
      shape: const CircleBorder(),
      child: IconButton(
        onPressed: onPressed,
        icon: AppSvgIcon(asset, color: color),
        iconSize: AppSizes.iconSm,
        constraints: const BoxConstraints.tightFor(width: 36, height: 36),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
