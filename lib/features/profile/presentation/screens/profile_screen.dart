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
import '../../../main/presentation/providers/main_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProfile user = context.watch<MainProvider>().user;

    return AppScaffold(
      title: 'Profile',
      showBack: false,
      body: ListView(
        children: [
          CircleAvatar(radius: 42, backgroundImage: AssetImage(user.avatar)),
          const SizedBox(height: AppSpacing.sm),
          Text(
            user.name,
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge,
          ),
          Text(
            user.email,
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall,
          ),
          const SizedBox(height: AppSpacing.lg),
          ProfileMenuTile(
            iconAsset: AppAssets.iconProfile,
            title: 'Your Profile',
            route: AppRoutes.editProfile,
          ),
          ProfileMenuTile(
            iconAsset: AppAssets.iconLocationPin,
            title: 'Manage Address',
            route: AppRoutes.manageAddress,
          ),
          ProfileMenuTile(
            iconAsset: AppAssets.iconCreditCard,
            title: 'Payment Methods',
            route: AppRoutes.paymentMethods,
          ),
          ProfileMenuTile(
            iconAsset: AppAssets.iconWalletSvg,
            title: 'My Wallet',
            route: AppRoutes.wallet,
          ),
          ProfileMenuTile(
            iconAsset: AppAssets.iconSettings,
            title: 'Settings',
            route: AppRoutes.settings,
          ),
          ProfileMenuTile(
            iconAsset: AppAssets.iconHelp,
            title: 'Help Center',
            route: AppRoutes.helpCenter,
          ),
        ],
      ),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProfile user = context.watch<MainProvider>().user;

    return AppScaffold(
      title: 'Your Profile',
      body: ListView(
        children: [
          CircleAvatar(radius: 48, backgroundImage: AssetImage(user.avatar)),
          const SizedBox(height: AppSpacing.lg),
          AppTextField(label: 'Name', hint: user.name),
          const SizedBox(height: AppSpacing.md),
          AppTextField(label: 'Phone Number', hint: user.phone),
          const SizedBox(height: AppSpacing.md),
          AppTextField(label: 'Email', hint: user.email),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(
            label: 'Gender',
            hint: 'Female',
            suffixIconAsset: AppAssets.iconArrowRight,
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(label: 'Update', onPressed: () => context.pop()),
        ],
      ),
    );
  }
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Wallet',
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: context.colors.primary,
              borderRadius: BorderRadius.circular(AppRadius.card),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Wallet',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  '\$1200.00',
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: 'Add Money',
            onPressed: () => context.pushNamed(AppRoutes.addMoney),
          ),
          const SizedBox(height: AppSpacing.lg),
          SectionHeader(title: 'Transactions'),
          ...[
            'Top Up',
            'Morning Run Shoes',
            'Light Brown Coat',
            'Cashback',
          ].map(
            (item) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const AppSvgIcon(AppAssets.iconWalletSvg),
              title: Text(item),
              subtitle: const Text('May 2026'),
              trailing: Text(
                item == 'Top Up' || item == 'Cashback'
                    ? '+\$250.00'
                    : '-\$120.00',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Add Money',
      body: ListView(
        children: [
          const AppTextField(
            label: 'Enter Amount',
            hint: '\$250.00',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              '\$10',
              '\$50',
              '\$100',
              '\$250',
              '\$500',
            ].map((amount) => Chip(label: Text(amount))).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: 'Add Money',
            onPressed: () => context.pushNamed(AppRoutes.topUpSuccess),
          ),
        ],
      ),
    );
  }
}

class SimpleSuccessScreen extends StatelessWidget {
  const SimpleSuccessScreen({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(AppAssets.orderSuccess, height: 150),
          const SizedBox(height: AppSpacing.lg),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            message,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium,
          ),
          const Spacer(),
          AppButton(
            label: 'OK',
            onPressed: () => context.pushNamedAndRemoveUntil(AppRoutes.main),
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Settings',
      body: ListView(
        children: [
          ProfileMenuTile(
            iconAsset: AppAssets.iconNotification,
            title: 'Notification Settings',
          ),
          ProfileMenuTile(
            iconAsset: AppAssets.iconLock,
            title: 'Password Manager',
            route: AppRoutes.passwordManager,
          ),
          ProfileMenuTile(
            iconAsset: AppAssets.iconDocument,
            title: 'Privacy Policy',
            route: AppRoutes.privacyPolicy,
          ),
        ],
      ),
    );
  }
}

class PasswordManagerScreen extends StatelessWidget {
  const PasswordManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Password Manager',
      body: ListView(
        children: [
          const AppTextField(
            label: 'Current Password',
            obscureText: true,
            suffixIconAsset: AppAssets.iconEyeOff,
          ),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(
            label: 'New Password',
            obscureText: true,
            suffixIconAsset: AppAssets.iconEyeOff,
          ),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(
            label: 'Confirm New Password',
            obscureText: true,
            suffixIconAsset: AppAssets.iconEyeOff,
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(label: 'Update Password', onPressed: () => context.pop()),
        ],
      ),
    );
  }
}

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Help Center',
      body: ListView(
        children: [
          SearchBarField(hint: 'Search help articles'),
          const SizedBox(height: AppSpacing.md),
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'FAQ', label: Text('FAQ')),
              ButtonSegment(value: 'Contact', label: Text('Contact Us')),
            ],
            selected: const {'FAQ'},
            onSelectionChanged: (_) {},
          ),
          const SizedBox(height: AppSpacing.md),
          ...[
            'Can I track my order?',
            'How do I return a product?',
            'Can I change my address?',
            'How do I apply coupons?',
          ].map(
            (faq) => ExpansionTile(
              title: Text(faq),
              children: const [
                Padding(
                  padding: EdgeInsets.all(AppSpacing.md),
                  child: Text(
                    'Yes. Open your order details to see the latest status and available support actions.',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Privacy Policy',
      body: ListView(
        children: [
          Text('Privacy Policy', style: context.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.md),
          Text(
            List.filled(
              6,
              'We collect only the account, order, and payment details required to provide a smooth shopping experience. Your personal information is protected and never sold. You may manage your profile, addresses, and notification preferences from settings.',
            ).join('\n\n'),
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Notification',
      body: ListView(
        children: [
          ...[
            'Order Shipped',
            'Flash Sale Alert',
            'Product Review Request',
            'New Payment Added',
          ].map(
            (title) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: context.colors.primary.withValues(alpha: 0.1),
                child: AppSvgIcon(
                  AppAssets.iconNotification,
                  color: context.colors.primary,
                ),
              ),
              title: Text(title),
              subtitle: const Text('Tap to view the latest update.'),
            ),
          ),
        ],
      ),
    );
  }
}
