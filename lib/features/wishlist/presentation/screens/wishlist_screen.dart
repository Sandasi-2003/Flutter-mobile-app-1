import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../main/presentation/providers/main_provider.dart';
import '../../../product/presentation/widgets/product_grid.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<MainProvider>().favorites;

    return AppScaffold(
      title: 'My Wishlist',
      showBack: false,
      body: favorites.isEmpty
          ? const AppEmptyState(title: 'Wishlist is empty')
          : ListView(children: [ProductGrid(products: favorites)]),
    );
  }
}
