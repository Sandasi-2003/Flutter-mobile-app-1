import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../shared/models/shop_models.dart';
import '../../../../shared/widgets/shop_ui.dart';
import '../../../main/presentation/providers/main_provider.dart';
import '../widgets/product_grid.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MainProvider controller = context.watch<MainProvider>();
    final List<Product> results = controller.searchProducts(_query);

    return AppScaffold(
      title: 'Search',
      body: ListView(
        children: [
          SearchBarField(
            controller: _controller,
            hint: 'Search shoes, coats, chairs',
            onChanged: (value) => setState(() => _query = value),
          ),
          const SizedBox(height: AppSpacing.md),
          if (_query.isEmpty) ...[
            SectionHeader(title: 'Recent Search'),
            ...['Black Shoes', 'Wood Chair', 'Light Brown Coat'].map(
              (term) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(term),
                trailing: const AppSvgIcon(AppAssets.iconClose),
                onTap: () => setState(() {
                  _controller.text = term;
                  _query = term;
                }),
              ),
            ),
          ] else if (controller.isLoadingProducts && results.isEmpty)
            const AppLoader(message: 'Searching products...')
          else if (results.isEmpty)
            const AppEmptyState(title: 'No results found')
          else ...[
            Text('Results for "$_query"', style: context.textTheme.titleMedium),
            const SizedBox(height: AppSpacing.md),
            ProductGrid(products: results),
          ],
        ],
      ),
    );
  }
}
