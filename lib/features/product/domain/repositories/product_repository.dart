import '../../../../shared/models/shop_models.dart';

abstract class ProductRepository {
  Future<ProductCatalog> getProducts();
}

class ProductCatalog {
  const ProductCatalog({required this.products, required this.categories});

  final List<Product> products;
  final List<ProductCategory> categories;
}
