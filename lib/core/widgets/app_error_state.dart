import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'app_button.dart';

class AppErrorState extends StatelessWidget {
  const AppErrorState({
    super.key,
    this.message = AppStrings.somethingWentWrong,
    this.onRetry,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAssets.errorState, height: 140),
            const SizedBox(height: AppSpacing.lg),
            Text(message, textAlign: TextAlign.center),
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.lg),
              AppButton(label: AppStrings.retry, onPressed: onRetry),
            ],
          ],
        ),
      ),
    );
  }
}
