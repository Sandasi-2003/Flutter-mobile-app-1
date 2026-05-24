import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../core/extensions/extensions.dart';
import '../../core/widgets/app_svg_icon.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        if (actionLabel != null)
          TextButton(onPressed: onAction, child: Text(actionLabel!)),
      ],
    );
  }
}

class SearchBarField extends StatelessWidget {
  const SearchBarField({
    super.key,
    this.onTap,
    this.onChanged,
    this.controller,
    this.hint = 'Search',
  });

  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      readOnly: onChanged == null,
      decoration: InputDecoration(
        hintText: hint,
        prefixIconConstraints: const BoxConstraints.tightFor(
          width: AppSizes.inputHeight,
          height: AppSizes.inputHeight,
        ),
        suffixIconConstraints: const BoxConstraints.tightFor(
          width: AppSizes.inputHeight,
          height: AppSizes.inputHeight,
        ),
        prefixIcon: Center(
          child: AppSvgIcon(
            AppAssets.iconSearch,
            size: AppSizes.iconSm,
            color: context.colors.onSurface.withValues(alpha: 0.52),
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(AppSpacing.xs),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.colors.primary,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: const Center(
              child: AppSvgIcon(
                AppAssets.iconFilter,
                color: Colors.white,
                size: AppSizes.iconSm,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChoiceTile extends StatelessWidget {
  const ChoiceTile({
    super.key,
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.iconAsset,
    required this.onTap,
  });

  final bool selected;
  final String title;
  final String subtitle;
  final String iconAsset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        tileColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
          side: BorderSide(
            color: selected ? context.colors.primary : AppColors.lightBorder,
          ),
        ),
        leading: AppSvgIcon(iconAsset, color: context.colors.primary),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: AppSvgIcon(
          selected ? AppAssets.iconCheckCircle : AppAssets.iconClose,
          color: selected
              ? context.colors.primary
              : AppColors.lightTextDisabled,
        ),
        onTap: onTap,
      ),
    );
  }
}

class SelectionCard extends StatelessWidget {
  const SelectionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconAsset,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String iconAsset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      leading: AppSvgIcon(iconAsset, color: context.colors.primary),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: onTap == null
          ? null
          : const AppSvgIcon(AppAssets.iconArrowRight),
      onTap: onTap,
    );
  }
}

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.iconAsset,
    required this.title,
    this.route,
  });

  final String iconAsset;
  final String title;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: AppSvgIcon(iconAsset, color: context.colors.primary),
      title: Text(title),
      trailing: const AppSvgIcon(AppAssets.iconArrowRight),
      onTap: route == null ? null : () => context.pushNamed(route!),
    );
  }
}

class RatingRow extends StatelessWidget {
  const RatingRow({super.key, required this.rating, this.size = 18});

  final double rating;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return AppSvgIcon(
          index + 1 <= rating.round()
              ? AppAssets.iconStarFilled
              : AppAssets.iconStar,
          color: context.appColors.rating,
          size: size,
        );
      }),
    );
  }
}

class PriceSummary extends StatelessWidget {
  const PriceSummary({
    super.key,
    required this.subtotal,
    required this.shipping,
    required this.discount,
    required this.total,
  });

  final double subtotal;
  final double shipping;
  final double discount;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Column(
        children: [
          _PriceRow(label: 'Subtotal', value: subtotal),
          _PriceRow(label: 'Shipping', value: shipping),
          _PriceRow(label: 'Discount', value: -discount),
          const Divider(),
          _PriceRow(label: 'Total', value: total, isTotal: true),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  const _PriceRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  final String label;
  final double value;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    final String sign = value < 0 ? '-' : '';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: isTotal
                  ? context.textTheme.titleMedium
                  : context.textTheme.bodyMedium,
            ),
          ),
          Text(
            '$sign\$${value.abs().toStringAsFixed(2)}',
            style:
                (isTotal
                        ? context.textTheme.titleMedium
                        : context.textTheme.bodyMedium)
                    ?.copyWith(color: isTotal ? context.colors.primary : null),
          ),
        ],
      ),
    );
  }
}

class QuantityControl extends StatelessWidget {
  const QuantityControl({
    super.key,
    required this.value,
    required this.onMinus,
    required this.onPlus,
  });

  final int value;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _MiniButton(
          key: const Key('quantity_minus'),
          asset: AppAssets.iconMinus,
          onPressed: onMinus,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Text('$value', style: context.textTheme.titleSmall),
        ),
        _MiniButton(
          key: const Key('quantity_plus'),
          asset: AppAssets.iconPlus,
          onPressed: onPlus,
        ),
      ],
    );
  }
}

class _MiniButton extends StatelessWidget {
  const _MiniButton({super.key, required this.asset, required this.onPressed});

  final String asset;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: context.colors.primary.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: AppSvgIcon(asset, size: 14, color: context.colors.primary),
        ),
      ),
    );
  }
}
