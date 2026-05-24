import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/models/shop_models.dart';
import '../../../../shared/widgets/shop_ui.dart';
import '../../../main/presentation/providers/main_provider.dart';
import '../widgets/product_filter_bottom_sheet.dart';
import '../widgets/product_grid.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, this.categoryId});

  final String? categoryId;

  @override
  Widget build(BuildContext context) {
    final MainProvider controller = context.watch<MainProvider>();
    final List<Product> products = categoryId == null
        ? controller.products
        : controller.productsByCategory(categoryId!);
    final String title = categoryId == null
        ? 'Products'
        : controller.categoryName(categoryId!);

    return AppScaffold(
      title: title,
      actions: [
        IconButton(
          onPressed: () => showProductFilterSheet(context),
          icon: const AppSvgIcon(AppAssets.iconFilter),
        ),
      ],
      body: ListView(
        children: [
          SearchBarField(onTap: () => context.pushNamed(AppRoutes.search)),
          const SizedBox(height: AppSpacing.md),
          if (controller.isLoadingProducts && products.isEmpty)
            const SizedBox(
              height: 300,
              child: AppLoader(message: 'Loading products...'),
            )
          else if (products.isEmpty)
            const AppEmptyState(title: 'No products found')
          else
            ProductGrid(products: products),
        ],
      ),
    );
  }
}
