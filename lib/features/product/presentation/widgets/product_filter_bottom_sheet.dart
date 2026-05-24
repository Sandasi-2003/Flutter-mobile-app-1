import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../shared/widgets/shop_ui.dart';

void showProductFilterSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Filter', style: context.textTheme.titleLarge),
            const SizedBox(height: AppSpacing.md),
            Text('Price Range', style: context.textTheme.titleMedium),
            RangeSlider(
              values: const RangeValues(50, 400),
              min: 0,
              max: 600,
              onChanged: (_) {},
            ),
            Text('Rating', style: context.textTheme.titleMedium),
            const RatingRow(rating: 4),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: 'Reset Filter',
                    variant: AppButtonVariant.outline,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: AppButton(
                    label: 'Apply',
                    onPressed: () => Navigator.pop(context),
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
