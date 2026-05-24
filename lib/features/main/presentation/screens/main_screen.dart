import 'package:flutter/material.dart';

import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../order/presentation/screens/order_list_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../wishlist/presentation/screens/wishlist_screen.dart';
import '../widgets/app_bottom_navigation_bar.dart';

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({super.key});

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const HomeScreen(),
      const WishlistScreen(),
      const CartScreen(isEmbedded: true),
      const OrdersScreen(isEmbedded: true),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _index, children: tabs),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _index,
        onTap: (value) => setState(() => _index = value),
      ),
    );
  }
}
