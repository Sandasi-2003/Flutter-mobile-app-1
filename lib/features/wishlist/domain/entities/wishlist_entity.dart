import '../../../product/domain/entities/product_entity.dart';

class Wishlist {
  const Wishlist({required this.products});

  final List<Product> products;
}
