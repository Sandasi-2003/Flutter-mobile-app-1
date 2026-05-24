import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../routes/app_routes.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      imageAsset: AppAssets.authLogin,
      title: 'Sign In',
      subtitle: 'Welcome back. Enter your email and password.',
      children: [
        const AppTextField(
          label: 'Email',
          hint: 'ester@example.com',
          prefixIconAsset: AppAssets.iconMail,
        ),
        const SizedBox(height: AppSpacing.md),
        const AppTextField(
          label: 'Password',
          hint: 'Password',
          obscureText: true,
          prefixIconAsset: AppAssets.iconLock,
          suffixIconAsset: AppAssets.iconEyeOff,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => context.pushNamed(AppRoutes.newPassword),
            child: const Text('Forgot Password?'),
          ),
        ),
        AppButton(
          label: 'Sign In',
          onPressed: () => context.pushNamedAndRemoveUntil(AppRoutes.main),
        ),
        const _SocialDivider(),
        _SocialButtons(),
        _AuthSwitch(
          text: 'Don\'t have an account?',
          action: 'Sign Up',
          onTap: () => context.pushNamed(AppRoutes.register),
        ),
      ],
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      imageAsset: AppAssets.authSignup,
      title: 'Create Account',
      subtitle:
          'Fill your information below or register with your social account.',
      children: [
        const AppTextField(
          label: 'Name',
          hint: 'Sandasi',
          prefixIconAsset: AppAssets.iconProfile,
        ),
        const SizedBox(height: AppSpacing.md),
        const AppTextField(
          label: 'Email',
          hint: 'sandasi@example.com',
          prefixIconAsset: AppAssets.iconMail,
        ),
        const SizedBox(height: AppSpacing.md),
        const AppTextField(
          label: 'Password',
          obscureText: true,
          prefixIconAsset: AppAssets.iconLock,
          suffixIconAsset: AppAssets.iconEyeOff,
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            Checkbox(value: true, onChanged: (_) {}),
            Expanded(
              child: Text(
                'Agree with Terms & Conditions',
                style: context.textTheme.bodySmall,
              ),
            ),
          ],
        ),
        AppButton(
          label: 'Sign Up',
          onPressed: () => context.pushNamed(AppRoutes.verifyCode),
        ),
        const _SocialDivider(),
        _SocialButtons(),
        _AuthSwitch(
          text: 'Already have an account?',
          action: 'Sign In',
          onTap: () => context.pushNamed(AppRoutes.login),
        ),
      ],
    );
  }
}

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      imageAsset: AppAssets.otpVerification,
      title: 'Verify Code',
      subtitle: 'Enter the verification code sent to your email.',
      children: [
        Row(
          children: List.generate(5, (index) {
            return Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.input),
                  border: Border.all(color: AppColors.lightBorder),
                ),
                child: Text(
                  index == 0 ? '8' : '',
                  style: context.textTheme.titleLarge,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: AppSpacing.lg),
        AppButton(
          label: 'Verify',
          onPressed: () => context.pushNamed(AppRoutes.completeProfile),
        ),
      ],
    );
  }
}

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      imageAsset: AppAssets.forgotPassword,
      title: 'New Password',
      subtitle: 'Create a new password so you can sign in again.',
      children: [
        const AppTextField(
          label: 'Password',
          obscureText: true,
          suffixIconAsset: AppAssets.iconEyeOff,
        ),
        const SizedBox(height: AppSpacing.md),
        const AppTextField(
          label: 'Confirm Password',
          obscureText: true,
          suffixIconAsset: AppAssets.iconEyeOff,
        ),
        const SizedBox(height: AppSpacing.lg),
        AppButton(
          label: 'Create New Password',
          onPressed: () => context.pushNamed(AppRoutes.login),
        ),
      ],
    );
  }
}

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      imageAsset: AppAssets.avatarPlaceholder,
      title: 'Complete Your Profile',
      subtitle: 'Do not worry, only you can see your personal data.',
      children: [
        Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 48,
                backgroundColor: context.colors.primary.withValues(alpha: 0.1),
                child: AppSvgIcon(
                  AppAssets.iconProfile,
                  color: context.colors.primary,
                  size: 48,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: context.colors.primary,
                  child: const AppSvgIcon(
                    AppAssets.iconEdit,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        const AppTextField(label: 'Name', hint: 'Sandasi'),
        const SizedBox(height: AppSpacing.md),
        const AppTextField(label: 'Phone Number', hint: '+94 77 123 4567'),
        const SizedBox(height: AppSpacing.md),
        const AppTextField(
          label: 'Gender',
          hint: 'Female',
          suffixIconAsset: AppAssets.iconArrowRight,
        ),
        const SizedBox(height: AppSpacing.lg),
        AppButton(
          label: 'Complete Profile',
          onPressed: () => context.pushNamed(AppRoutes.locationAccess),
        ),
      ],
    );
  }
}

class LocationAccessScreen extends StatelessWidget {
  const LocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionScreen(
      iconAsset: AppAssets.iconLocationPin,
      imageAsset: AppAssets.locationPinMap,
      title: 'What is Your Location?',
      subtitle:
          'We need to know your location in order to suggest nearby services.',
      primaryLabel: 'Allow Location Access',
      secondaryLabel: 'Enter Location Manually',
      onPrimary: () => context.pushNamed(AppRoutes.notificationAccess),
      onSecondary: () => context.pushNamed(AppRoutes.notificationAccess),
    );
  }
}

class NotificationAccessScreen extends StatelessWidget {
  const NotificationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionScreen(
      iconAsset: AppAssets.iconNotification,
      imageAsset: AppAssets.emptyNotifications,
      title: 'Enable Notification Access',
      subtitle:
          'We will send helpful updates about orders, offers, and payment activity.',
      primaryLabel: 'Allow Notification',
      secondaryLabel: 'Maybe Later',
      onPrimary: () => context.pushNamedAndRemoveUntil(AppRoutes.main),
      onSecondary: () => context.pushNamedAndRemoveUntil(AppRoutes.main),
    );
  }
}

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({
    super.key,
    required this.iconAsset,
    this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.onPrimary,
    required this.onSecondary,
  });

  final String iconAsset;
  final String? imageAsset;
  final String title;
  final String subtitle;
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback onPrimary;
  final VoidCallback onSecondary;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          if (imageAsset != null)
            Image.asset(imageAsset!, height: 170)
          else
            CircleAvatar(
              radius: 42,
              backgroundColor: context.colors.primary.withValues(alpha: 0.1),
              child: AppSvgIcon(
                iconAsset,
                color: context.colors.primary,
                size: 42,
              ),
            ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.xl),
          AppButton(label: primaryLabel, onPressed: onPrimary),
          AppButton(
            label: secondaryLabel,
            variant: AppButtonVariant.ghost,
            onPressed: onSecondary,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class AuthShell extends StatelessWidget {
  const AuthShell({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
    this.imageAsset,
  });

  final String title;
  final String subtitle;
  final List<Widget> children;
  final String? imageAsset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            if (imageAsset != null) ...[
              Image.asset(imageAsset!, height: 140),
              const SizedBox(height: AppSpacing.md),
            ],
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall,
            ),
            const SizedBox(height: AppSpacing.xl),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _SocialDivider extends StatelessWidget {
  const _SocialDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Text('Or sign in with', style: context.textTheme.bodySmall),
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}

class _SocialButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _SocialButton(asset: AppAssets.iconApple),
        SizedBox(width: AppSpacing.md),
        _SocialButton(asset: AppAssets.iconGoogle),
        SizedBox(width: AppSpacing.md),
        _SocialButton(asset: AppAssets.iconFacebook),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: context.colors.surface,
      child: AppSvgIcon(asset, color: context.colors.onSurface),
    );
  }
}

class _AuthSwitch extends StatelessWidget {
  const _AuthSwitch({
    required this.text,
    required this.action,
    required this.onTap,
  });

  final String text;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.lg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: context.textTheme.bodySmall),
          TextButton(onPressed: onTap, child: Text(action)),
        ],
      ),
    );
  }
}
