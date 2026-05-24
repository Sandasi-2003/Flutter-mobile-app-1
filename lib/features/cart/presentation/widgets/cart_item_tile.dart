import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../shared/models/shop_models.dart';
import '../../../../shared/widgets/shop_ui.dart';
import '../../../main/presentation/providers/main_provider.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final MainProvider controller = context.read<MainProvider>();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 72,
            height: 72,
            child: AppNetworkImage(
              imageUrl: item.product.image,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.product.name, style: context.textTheme.titleSmall),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '\$${item.product.price.toStringAsFixed(2)}',
                  style: context.textTheme.bodySmall,
                ),
                const SizedBox(height: AppSpacing.sm),
                QuantityControl(
                  value: item.quantity,
                  onMinus: () => controller.changeQuantity(item.product.id, -1),
                  onPlus: () => controller.changeQuantity(item.product.id, 1),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _showRemoveSheet(context, item),
            icon: const AppSvgIcon(AppAssets.iconTrash),
          ),
        ],
      ),
    );
  }

  void _showRemoveSheet(BuildContext context, CartItem item) {
    showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Remove from Cart?', style: context.textTheme.titleLarge),
              const SizedBox(height: AppSpacing.md),
              CartItemTile(item: item),
              const SizedBox(height: AppSpacing.lg),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: 'Cancel',
                      variant: AppButtonVariant.outline,
                      onPressed: () => Navigator.pop(sheetContext),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: AppButton(
                      label: 'Yes, Remove',
                      onPressed: () {
                        context.read<MainProvider>().removeFromCart(
                          item.product.id,
                        );
                        Navigator.pop(sheetContext);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
