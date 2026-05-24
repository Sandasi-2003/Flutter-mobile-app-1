import 'package:flutter/material.dart';

import '../core/constants/constants.dart';
import '../features/auth/presentation/screens/auth_screens.dart';
import '../features/address/presentation/screens/address_list_screen.dart';
import '../features/cart/presentation/screens/cart_screen.dart';
import '../features/category/presentation/screens/category_screen.dart';
import '../features/checkout/presentation/screens/checkout_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/main/presentation/screens/main_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/order/presentation/screens/order_list_screen.dart';
import '../features/product/presentation/screens/product_details_screen.dart';
import '../features/product/presentation/screens/product_list_screen.dart';
import '../features/product/presentation/screens/product_search_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
      case AppRoutes.splash:
        return _buildRoute(settings, const SplashScreen());
      case AppRoutes.onboarding:
        return _buildRoute(settings, const OnboardingScreen());
      case AppRoutes.login:
        return _buildRoute(settings, const SignInScreen());
      case AppRoutes.register:
        return _buildRoute(settings, const SignUpScreen());
      case AppRoutes.verifyCode:
        return _buildRoute(settings, const VerifyCodeScreen());
      case AppRoutes.newPassword:
        return _buildRoute(settings, const NewPasswordScreen());
      case AppRoutes.completeProfile:
        return _buildRoute(settings, const CompleteProfileScreen());
      case AppRoutes.locationAccess:
        return _buildRoute(settings, const LocationAccessScreen());
      case AppRoutes.notificationAccess:
        return _buildRoute(settings, const NotificationAccessScreen());
      case AppRoutes.main:
        return _buildRoute(settings, const MainShellScreen());
      case AppRoutes.home:
        return _buildRoute(settings, const HomeScreen());
      case AppRoutes.categories:
        return _buildRoute(settings, const CategoryScreen());
      case AppRoutes.products:
        return _buildRoute(
          settings,
          ProductListScreen(categoryId: settings.arguments as String?),
        );
      case AppRoutes.search:
        return _buildRoute(settings, const SearchScreen());
      case AppRoutes.productDetails:
        return _buildRoute(
          settings,
          ProductDetailsScreen(
            productId: settings.arguments as String? ?? 'p1',
          ),
        );
      case AppRoutes.reviews:
        return _buildRoute(settings, const ReviewsScreen());
      case AppRoutes.writeReview:
        return _buildRoute(settings, const WriteReviewScreen());
      case AppRoutes.cart:
        return _buildRoute(settings, const CartScreen());
      case AppRoutes.checkout:
        return _buildRoute(settings, const CheckoutScreen());
      case AppRoutes.shippingAddress:
        return _buildRoute(settings, const ShippingAddressScreen());
      case AppRoutes.paymentMethods:
        return _buildRoute(settings, const PaymentMethodsScreen());
      case AppRoutes.addCard:
        return _buildRoute(settings, const AddCardScreen());
      case AppRoutes.coupons:
        return _buildRoute(settings, const CouponsScreen());
      case AppRoutes.paymentSuccess:
        return _buildRoute(settings, const PaymentSuccessScreen());
      case AppRoutes.receipt:
        return _buildRoute(settings, const ReceiptScreen());
      case AppRoutes.orders:
        return _buildRoute(settings, const OrdersScreen());
      case AppRoutes.trackOrder:
        return _buildRoute(settings, const TrackOrderScreen());
      case AppRoutes.profile:
        return _buildRoute(settings, const ProfileScreen());
      case AppRoutes.editProfile:
        return _buildRoute(settings, const EditProfileScreen());
      case AppRoutes.manageAddress:
        return _buildRoute(settings, const ManageAddressScreen());
      case AppRoutes.wallet:
        return _buildRoute(settings, const WalletScreen());
      case AppRoutes.addMoney:
        return _buildRoute(settings, const AddMoneyScreen());
      case AppRoutes.topUpSuccess:
        return _buildRoute(
          settings,
          const SimpleSuccessScreen(
            title: 'Top Up Successful!',
            message: 'Your balance has been updated.',
          ),
        );
      case AppRoutes.settings:
        return _buildRoute(settings, const SettingsScreen());
      case AppRoutes.passwordManager:
        return _buildRoute(settings, const PasswordManagerScreen());
      case AppRoutes.helpCenter:
        return _buildRoute(settings, const HelpCenterScreen());
      case AppRoutes.privacyPolicy:
        return _buildRoute(settings, const PrivacyPolicyScreen());
      case AppRoutes.notifications:
        return _buildRoute(settings, const NotificationsScreen());

      default:
        return _buildRoute(settings, const _RouteNotFoundScreen());
    }
  }

  static MaterialPageRoute<dynamic> _buildRoute(
    RouteSettings settings,
    Widget page,
  ) {
    return MaterialPageRoute<dynamic>(settings: settings, builder: (_) => page);
  }
}

class _RouteNotFoundScreen extends StatelessWidget {
  const _RouteNotFoundScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route Not Found')),
      body: const Center(child: Text(AppStrings.somethingWentWrong)),
    );
  }
}
