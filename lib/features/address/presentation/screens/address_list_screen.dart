import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/widgets/shop_ui.dart';
import '../../../main/presentation/providers/main_provider.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainProvider controller = context.watch<MainProvider>();

    return AppScaffold(
      title: 'Shipping Address',
      body: ListView(
        children: [
          ...controller.addresses.map((address) {
            return ChoiceTile(
              selected: address.id == controller.selectedAddressId,
              title: address.label,
              subtitle: '${address.name}\n${address.line}',
              iconAsset: AppAssets.iconLocationPin,
              onTap: () => controller.selectAddress(address.id),
            );
          }),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton.icon(
            onPressed: () => context.pushNamed(AppRoutes.manageAddress),
            icon: const AppSvgIcon(AppAssets.iconPlus),
            label: const Text('Add New Shipping Address'),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: AppButton(label: 'Apply', onPressed: () => context.pop()),
        ),
      ),
    );
  }
}

class ManageAddressScreen extends StatelessWidget {
  const ManageAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addresses = context.watch<MainProvider>().addresses;

    return AppScaffold(
      title: 'Manage Address',
      body: ListView(
        children: [
          ...addresses.map(
            (address) => ListTile(
              leading: const AppSvgIcon(AppAssets.iconLocationPin),
              title: Text(address.label),
              subtitle: Text(address.line),
              trailing: const AppSvgIcon(AppAssets.iconEdit),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(label: 'Address Label', hint: 'Home'),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(
            label: 'Complete Address',
            hint: 'Street, city, postal code',
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(label: 'Save Address', onPressed: () => context.pop()),
        ],
      ),
    );
  }
}
