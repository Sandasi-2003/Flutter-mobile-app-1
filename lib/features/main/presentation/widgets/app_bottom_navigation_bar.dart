import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_svg_icon.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: _NavIcon(
            asset: currentIndex == 0
                ? AppAssets.iconHomeFilled
                : AppAssets.iconHome,
            selected: currentIndex == 0,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _NavIcon(
            asset: currentIndex == 1
                ? AppAssets.iconWishlistFilled
                : AppAssets.iconWishlist,
            selected: currentIndex == 1,
          ),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: _NavIcon(
            asset: currentIndex == 2
                ? AppAssets.iconShoppingBagFilled
                : AppAssets.iconShoppingBag,
            selected: currentIndex == 2,
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: _NavIcon(
            asset: AppAssets.iconReceipt,
            selected: currentIndex == 3,
          ),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: _NavIcon(
            asset: currentIndex == 4
                ? AppAssets.iconProfileFilled
                : AppAssets.iconProfile,
            selected: currentIndex == 4,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({required this.asset, required this.selected});

  final String asset;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AppSvgIcon(
      asset,
      color: selected ? context.colors.primary : AppColors.lightTextDisabled,
    );
  }
}
