import 'product_entity.dart';

class ProductDetails extends Product {
  const ProductDetails({
    required super.id,
    required super.name,
    required super.categoryId,
    required super.brand,
    required super.price,
    required super.oldPrice,
    required super.rating,
    required super.reviewCount,
    required super.image,
    required super.description,
    required super.colors,
    required super.sizes,
    super.reviews,
  });
}
