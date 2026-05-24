import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/models/shop_models.dart';
import '../../../../shared/widgets/shop_ui.dart';
import '../../../cart/presentation/widgets/cart_item_tile.dart';
import '../../../main/presentation/providers/main_provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainProvider controller = context.watch<MainProvider>();
    final Address address = controller.addresses.firstWhere(
      (item) => item.id == controller.selectedAddressId,
    );
    final PaymentMethod payment = controller.paymentMethods.firstWhere(
      (item) => item.id == controller.selectedPaymentId,
    );

    return AppScaffold(
      title: 'Checkout',
      body: ListView(
        children: [
          SelectionCard(
            title: 'Shipping Address',
            subtitle: '${address.label} - ${address.line}',
            iconAsset: AppAssets.iconLocationPin,
            onTap: () => context.pushNamed(AppRoutes.shippingAddress),
          ),
          const SizedBox(height: AppSpacing.md),
          SelectionCard(
            title: 'Choose Shipping Type',
            subtitle: controller.selectedDelivery,
            iconAsset: AppAssets.iconTruck,
            onTap: () => _showDeliverySheet(context),
          ),
          const SizedBox(height: AppSpacing.md),
          SelectionCard(
            title: 'Payment Method',
            subtitle: '${payment.title} ${payment.subtitle}',
            iconAsset: payment.iconAsset,
            onTap: () => context.pushNamed(AppRoutes.paymentMethods),
          ),
          const SizedBox(height: AppSpacing.lg),
          SectionHeader(title: 'Order List'),
          ...controller.cartItems.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: CartItemTile(item: item),
            ),
          ),
          PriceSummary(
            subtotal: controller.subtotal,
            shipping: controller.shipping,
            discount: controller.discount,
            total: controller.total,
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: AppButton(
            label: 'Continue to Payment',
            onPressed: () => context.pushNamed(AppRoutes.paymentSuccess),
          ),
        ),
      ),
    );
  }
}

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainProvider controller = context.watch<MainProvider>();

    return AppScaffold(
      title: 'Payment Methods',
      body: ListView(
        children: [
          Image.asset(AppAssets.paymentCard, height: 150, fit: BoxFit.cover),
          const SizedBox(height: AppSpacing.lg),
          ...controller.paymentMethods.map((method) {
            return ChoiceTile(
              selected: method.id == controller.selectedPaymentId,
              title: method.title,
              subtitle: method.subtitle,
              iconAsset: method.iconAsset,
              onTap: () => controller.selectPayment(method.id),
            );
          }),
          ListTile(
            leading: const AppSvgIcon(AppAssets.iconCreditCard),
            title: const Text('Add Card'),
            trailing: const AppSvgIcon(AppAssets.iconArrowRight),
            onTap: () => context.pushNamed(AppRoutes.addCard),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: AppButton(
            label: 'Confirm Payment',
            onPressed: () => context.pop(),
          ),
        ),
      ),
    );
  }
}

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Add Card',
      body: ListView(
        children: [
          Image.asset(AppAssets.paymentCard, height: 160, fit: BoxFit.cover),
          const SizedBox(height: AppSpacing.lg),
          const AppTextField(label: 'Card Holder Name', hint: 'Sandasi'),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(
            label: 'Card Number',
            hint: '4716 9627 1635 8047',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: AppSpacing.md),
          const Row(
            children: [
              Expanded(
                child: AppTextField(label: 'Expiry Date', hint: '02/30'),
              ),
              SizedBox(width: AppSpacing.md),
              Expanded(
                child: AppTextField(label: 'CVV', hint: '107'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(label: 'Add Card', onPressed: () => context.pop()),
        ],
      ),
    );
  }
}

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainProvider controller = context.watch<MainProvider>();

    return AppScaffold(
      title: 'Coupon',
      body: ListView.separated(
        itemCount: controller.coupons.length,
        separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.md),
        itemBuilder: (context, index) {
          final coupon = controller.coupons[index];
          return Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(AppRadius.card),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coupon.title, style: context.textTheme.titleMedium),
                const SizedBox(height: AppSpacing.xs),
                Text(coupon.description, style: context.textTheme.bodySmall),
                const SizedBox(height: AppSpacing.sm),
                AppButton(
                  label: 'Copy Code: ${coupon.code}',
                  onPressed: () {
                    controller.applyCoupon(coupon);
                    context.pop();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(AppAssets.paymentSuccess, height: 150),
          const SizedBox(height: AppSpacing.lg),
          Text('Payment Successful!', style: context.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Thank you for your purchase.',
            style: context.textTheme.bodyMedium,
          ),
          const Spacer(),
          AppButton(
            label: 'View Order',
            onPressed: () => context.pushNamed(AppRoutes.receipt),
          ),
          AppButton(
            label: 'View E-Receipt',
            variant: AppButtonVariant.ghost,
            onPressed: () => context.pushNamed(AppRoutes.receipt),
          ),
        ],
      ),
    );
  }
}

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainProvider controller = context.watch<MainProvider>();

    return AppScaffold(
      title: 'E-Receipt',
      body: ListView(
        children: [
          Container(
            height: 96,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Text(
              '||||||||||||||||||||||||||||||||||||',
              style: context.textTheme.displaySmall?.copyWith(letterSpacing: 2),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          ...controller.cartItems.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: CartItemTile(item: item),
            ),
          ),
          PriceSummary(
            subtotal: controller.subtotal,
            shipping: controller.shipping,
            discount: controller.discount,
            total: controller.total,
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(label: 'Download E-Receipt', onPressed: () {}),
        ],
      ),
    );
  }
}

void _showDeliverySheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (context) {
      final MainProvider controller = context.watch<MainProvider>();
      return Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Choose Shipping', style: context.textTheme.titleLarge),
            ChoiceTile(
              selected: controller.selectedDelivery == 'Economy',
              title: 'Economy',
              subtitle: 'Estimated arrival 5-7 days',
              iconAsset: AppAssets.iconTruck,
              onTap: () {
                controller.selectDelivery('Economy');
                Navigator.pop(context);
              },
            ),
            ChoiceTile(
              selected: controller.selectedDelivery == 'Regular',
              title: 'Regular',
              subtitle: 'Estimated arrival 3-4 days',
              iconAsset: AppAssets.iconTruck,
              onTap: () {
                controller.selectDelivery('Regular');
                Navigator.pop(context);
              },
            ),
            ChoiceTile(
              selected: controller.selectedDelivery == 'Express',
              title: 'Express',
              subtitle: 'Estimated arrival 1-2 days',
              iconAsset: AppAssets.iconTruck,
              onTap: () {
                controller.selectDelivery('Express');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
