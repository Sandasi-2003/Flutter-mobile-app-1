import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'app_svg_icon.dart';

enum AppButtonVariant { primary, outline, ghost }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.iconAsset,
    this.variant = AppButtonVariant.primary,
    this.isExpanded = true,
    this.height = AppSizes.buttonHeight,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final String? iconAsset;
  final AppButtonVariant variant;
  final bool isExpanded;
  final double height;

  @override
  Widget build(BuildContext context) {
    final Widget child = Row(
      mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (iconAsset != null || icon != null) ...[
          iconAsset == null
              ? Icon(icon, size: AppSizes.iconSm)
              : AppSvgIcon(iconAsset!, size: AppSizes.iconSm),
          const SizedBox(width: AppSpacing.sm),
        ],
        Flexible(
          child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
      ],
    );

    final ButtonStyle style = switch (variant) {
      AppButtonVariant.primary => ElevatedButton.styleFrom(
        minimumSize: Size(isExpanded ? double.infinity : 0, height),
      ),
      AppButtonVariant.outline => OutlinedButton.styleFrom(
        minimumSize: Size(isExpanded ? double.infinity : 0, height),
      ),
      AppButtonVariant.ghost => TextButton.styleFrom(
        minimumSize: Size(isExpanded ? double.infinity : 0, height),
      ),
    };

    return switch (variant) {
      AppButtonVariant.primary => ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: child,
      ),
      AppButtonVariant.outline => OutlinedButton(
        onPressed: onPressed,
        style: style,
        child: child,
      ),
      AppButtonVariant.ghost => TextButton(
        onPressed: onPressed,
        style: style,
        child: child,
      ),
    };
  }
}
