import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../shared/models/shop_models.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({super.key, required this.category, this.onTap});

  final ProductCategory category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Column(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: context.colors.primary.withValues(alpha: 0.09),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: AppSvgIcon(
              category.iconAsset,
              color: context.colors.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            category.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
