import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../core/network/api_client.dart';
import '../features/main/presentation/providers/main_provider.dart';
import '../features/product/data/datasources/product_remote_datasource.dart';
import '../features/product/data/repositories/product_repository_impl.dart';
import 'theme_provider.dart';

class AppProviders {
  AppProviders._();

  static List<SingleChildWidget> get providers {
    return [
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider()..loadTheme(),
      ),
      ChangeNotifierProvider<MainProvider>(
        create: (_) => MainProvider(
          productRepository: ProductRepositoryImpl(
            remoteDataSource: ProductRemoteDataSource(
              apiClient: ApiClient.instance,
            ),
          ),
        )..loadProducts(),
      ),
    ];
  }
}
