import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/widgets/shop_ui.dart';
import '../../../category/presentation/widgets/category_card.dart';
import '../../../main/presentation/providers/main_provider.dart';
import '../../../product/presentation/widgets/product_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainProvider controller = context.watch<MainProvider>();

    return AppScaffold(
      safeArea: false,
      padding: EdgeInsets.zero,
      body: ListView(
        padding: EdgeInsets.only(
          left: AppSpacing.md,
          right: AppSpacing.md,
          top: context.statusBarHeight + AppSpacing.md,
          bottom: AppSpacing.xl,
        ),
        children: [
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(controller.user.avatar)),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good Morning', style: context.textTheme.bodySmall),
                    Text(
                      controller.user.name,
                      style: context.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              IconButton.filledTonal(
                onPressed: () => context.pushNamed(AppRoutes.notifications),
                icon: const AppSvgIcon(AppAssets.iconNotification),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          SearchBarField(onTap: () => context.pushNamed(AppRoutes.search)),
          const SizedBox(height: AppSpacing.md),
          Container(
            height: 154,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: context.colors.primary,
              borderRadius: BorderRadius.circular(AppRadius.card),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Get Special Offer',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Up to 40%',
                        style: context.textTheme.displaySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () => context.pushNamed(AppRoutes.products),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 38),
                          backgroundColor: Colors.white,
                          foregroundColor: context.colors.primary,
                        ),
                        child: const Text('Shop Now'),
                      ),
                    ],
                  ),
                ),
                Image.asset(AppAssets.saleBanner, width: 120),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          SectionHeader(
            title: 'Category',
            actionLabel: 'See All',
            onAction: () => context.pushNamed(AppRoutes.categories),
          ),
          SizedBox(
            height: 92,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return SizedBox(
                  width: 70,
                  child: CategoryChip(
                    category: category,
                    onTap: () => context.pushNamed(
                      AppRoutes.products,
                      arguments: category.id,
                    ),
                  ),
                );
              },
            ),
          ),
          SectionHeader(
            title: 'Flash Sale',
            actionLabel: 'See All',
            onAction: () => context.pushNamed(AppRoutes.products),
          ),
          if (controller.isLoadingProducts && controller.products.isEmpty)
            const SizedBox(
              height: 260,
              child: AppLoader(message: 'Loading products...'),
            )
          else ...[
            if (controller.productsError != null) ...[
              Text(
                controller.productsError!,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colors.primary,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
            ProductGrid(products: controller.products),
          ],
        ],
      ),
    );
  }
}
