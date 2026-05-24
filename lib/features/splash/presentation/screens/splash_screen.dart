import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/services/services.dart';
import '../../../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _scaleAnimation = Tween<double>(begin: 0.92, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _animationController.forward();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future<void>.delayed(AppDurations.splashDelay);

    final bool hasCompletedOnboarding = LocalStorageService.instance
        .hasCompletedOnboarding();

    if (!mounted) return;

    if (hasCompletedOnboarding) {
      NavigationService.instance.pushNamedAndRemoveUntil(AppRoutes.main);
    } else {
      NavigationService.instance.pushNamedAndRemoveUntil(AppRoutes.onboarding);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: context.colors.primary,
        systemNavigationBarColor: context.colors.primary,
      ),
      child: Scaffold(
        backgroundColor: context.colors.primary,
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Semantics(
                      label: AppStrings.appName,
                      image: true,
                      child: Image.asset(
                        AppAssets.splashLogoWhite,
                        key: const Key('splash_logo'),
                        width: 210,
                        height: 210,
                        fit: BoxFit.contain,
                        errorBuilder: (_, _, _) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 58,
                                height: 58,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.shopping_bag_rounded,
                                  color: context.colors.primary,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.sm),
                              Text(
                                AppStrings.appName,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: AppSpacing.sm,
                child: Center(
                  child: Container(
                    width: 118,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
