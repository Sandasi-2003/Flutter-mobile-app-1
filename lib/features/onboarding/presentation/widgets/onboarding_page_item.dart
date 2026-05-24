import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../providers/onboarding_provider.dart';

class OnboardingPageItem extends StatelessWidget {
  const OnboardingPageItem({super.key, required this.slide});

  final OnboardingSlide slide;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(slide.image, fit: BoxFit.contain)),
        Text(
          slide.title,
          textAlign: TextAlign.center,
          style: context.textTheme.headlineSmall?.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          slide.description,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
