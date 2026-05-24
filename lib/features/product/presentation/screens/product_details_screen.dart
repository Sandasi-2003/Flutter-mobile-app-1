import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/models/shop_models.dart';
import '../../../../shared/widgets/shop_ui.dart';
import '../../../main/presentation/providers/main_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final MainProvider controller = context.watch<MainProvider>();
    final Product product = controller.productById(productId);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 340,
            actions: [
              IconButton(
                onPressed: () => controller.toggleFavorite(product.id),
                icon: AppSvgIcon(
                  controller.isFavorite(product.id)
                      ? AppAssets.iconWishlistFilled
                      : AppAssets.iconWishlist,
                  color: context.colors.primary,
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: AppNetworkImage(
                imageUrl: product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: context.textTheme.headlineSmall),
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      RatingRow(rating: product.rating),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        '${product.rating} (${product.reviewCount} reviews)',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text('Product Details', style: context.textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    product.description,
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text('Select Color', style: context.textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: product.colors.map((color) {
                      return Container(
                        width: 28,
                        height: 28,
                        margin: const EdgeInsets.only(right: AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.lightBorder,
                            width: 2,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text('Size', style: context.textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    children: product.sizes.map((size) {
                      return Chip(label: Text(size));
                    }).toList(),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Reviews'),
                    subtitle: Text(
                      '${product.reviews.length} customer reviews',
                    ),
                    trailing: const AppSvgIcon(AppAssets.iconArrowRight),
                    onTap: () => context.pushNamed(AppRoutes.reviews),
                  ),
                  const SizedBox(height: 92),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: context.colors.primary,
                  ),
                ),
              ),
              Expanded(
                child: AppButton(
                  label: 'Add to Cart',
                  iconAsset: AppAssets.iconShoppingBag,
                  onPressed: () {
                    controller.addToCart(product);
                    context.showSnackBarMessage('Added to cart');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reviews = context.watch<MainProvider>().reviews;

    return AppScaffold(
      title: 'Reviews',
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Text('4.5', style: context.textTheme.displaySmall),
                const RatingRow(rating: 4.5, size: 24),
                const SizedBox(height: AppSpacing.md),
              ],
            ),
          ),
          ...reviews.map((review) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(backgroundImage: AssetImage(review.avatar)),
              title: Text(review.user),
              subtitle: Text(review.comment),
              trailing: RatingRow(rating: review.rating, size: 14),
            );
          }),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: AppButton(
            label: 'Write Review',
            onPressed: () => context.pushNamed(AppRoutes.writeReview),
          ),
        ),
      ),
    );
  }
}

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Leave Review',
      body: ListView(
        children: [
          Text(
            'How is your order?',
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.md),
          const Center(child: RatingRow(rating: 5, size: 34)),
          const SizedBox(height: AppSpacing.lg),
          const AppTextField(
            label: 'Add Review',
            hint: 'Write your thoughts',
            maxLines: 5,
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  label: 'Cancel',
                  variant: AppButtonVariant.outline,
                  onPressed: () => context.pop(),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: AppButton(
                  label: 'Submit',
                  onPressed: () => context.pop(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
