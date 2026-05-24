import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/models/shop_models.dart';
import '../../../../shared/widgets/shop_ui.dart';
import '../../../main/presentation/providers/main_provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key, this.isEmbedded = false});

  final bool isEmbedded;

  @override
  Widget build(BuildContext context) {
    final orders = context.watch<MainProvider>().orders;

    return AppScaffold(
      title: 'My Orders',
      showBack: !isEmbedded,
      body: ListView(
        children: [
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'Active', label: Text('Active')),
              ButtonSegment(value: 'Completed', label: Text('Completed')),
              ButtonSegment(value: 'Canceled', label: Text('Canceled')),
            ],
            selected: const {'Active'},
            onSelectionChanged: (_) {},
          ),
          const SizedBox(height: AppSpacing.md),
          ...orders.map((order) {
            final OrderItem firstItem = order.items.first;
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: AppSpacing.sm,
              ),
              leading: SizedBox(
                width: 58,
                height: 58,
                child: AppNetworkImage(
                  imageUrl: firstItem.product.image,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
              ),
              title: Text(firstItem.product.name),
              subtitle: Text('${order.id} • ${order.status}'),
              trailing: FilledButton(
                onPressed: () => context.pushNamed(AppRoutes.trackOrder),
                child: const Text('Track'),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const steps = ['Order Placed', 'In Progress', 'Shipped', 'Delivered'];

    return AppScaffold(
      title: 'Track Order',
      body: ListView(
        children: [
          SelectionCard(
            title: 'Aury Chair',
            subtitle: 'Expected Delivery: 23 Sep 2026',
            iconAsset: AppAssets.iconChair,
          ),
          const SizedBox(height: AppSpacing.lg),
          ...steps.asMap().entries.map((entry) {
            final bool active = entry.key < 2;
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: active
                    ? context.colors.primary
                    : AppColors.lightBorder,
                child: AppSvgIcon(
                  active ? AppAssets.iconCheck : AppAssets.iconOrder,
                  color: Colors.white,
                ),
              ),
              title: Text(entry.value),
              subtitle: Text(active ? 'Updated today' : 'Pending update'),
            );
          }),
        ],
      ),
    );
  }
}
