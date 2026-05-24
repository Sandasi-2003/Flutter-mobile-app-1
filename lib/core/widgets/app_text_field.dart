import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'app_svg_icon.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.prefixIcon,
    this.prefixIconAsset,
    this.suffixIcon,
    this.suffixIconAsset,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines = 1,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final String? prefixIconAsset;
  final Widget? suffixIcon;
  final String? suffixIconAsset;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: _fieldIcon(context, prefixIconAsset, prefixIcon),
        suffixIcon: suffixIcon ?? _fieldIcon(context, suffixIconAsset, null),
      ),
    );
  }

  Widget? _fieldIcon(BuildContext context, String? asset, IconData? icon) {
    if (asset == null && icon == null) return null;
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: asset == null
          ? Icon(icon, size: AppSizes.iconSm)
          : AppSvgIcon(
              asset,
              size: AppSizes.iconSm,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.56),
            ),
    );
  }
}
