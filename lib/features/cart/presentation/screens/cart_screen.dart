import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/widgets/shop_ui.dart';
import '../../../main/presentation/providers/main_provider.dart';
import '../widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, this.isEmbedded = false});

  final bool isEmbedded;

  @override
  Widget build(BuildContext context) {
    final MainProvider controller = context.watch<MainProvider>();
    final Widget content = controller.cartItems.isEmpty
        ? const AppEmptyState(title: 'Your cart is empty')
        : ListView.separated(
            itemCount: controller.cartItems.length + 2,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.md),
            itemBuilder: (context, index) {
              if (index < controller.cartItems.length) {
                return CartItemTile(item: controller.cartItems[index]);
              }
              if (index == controller.cartItems.length) {
                return Row(
                  children: [
                    const Expanded(child: AppTextField(hint: 'Promo Code')),
                    const SizedBox(width: AppSpacing.sm),
                    AppButton(
                      label: 'Apply',
                      isExpanded: false,
                      onPressed: () => context.pushNamed(AppRoutes.coupons),
                    ),
                  ],
                );
              }
              return PriceSummary(
                subtotal: controller.subtotal,
                shipping: controller.shipping,
                discount: controller.discount,
                total: controller.total,
              );
            },
          );

    return AppScaffold(
      title: 'My Cart',
      showBack: !isEmbedded,
      body: content,
      bottomNavigationBar: controller.cartItems.isEmpty
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: AppButton(
                  label: 'Proceed to Checkout',
                  onPressed: () => context.pushNamed(AppRoutes.checkout),
                ),
              ),
            ),
    );
  }
}
