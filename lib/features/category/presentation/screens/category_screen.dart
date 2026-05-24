import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../routes/app_routes.dart';
import '../../../main/presentation/providers/main_provider.dart';
import '../widgets/category_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<MainProvider>().categories;

    return AppScaffold(
      title: 'Category',
      body: GridView.builder(
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: AppSpacing.md,
          crossAxisSpacing: AppSpacing.md,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryChip(
            category: category,
            onTap: () =>
                context.pushNamed(AppRoutes.products, arguments: category.id),
          );
        },
      ),
    );
  }
}
