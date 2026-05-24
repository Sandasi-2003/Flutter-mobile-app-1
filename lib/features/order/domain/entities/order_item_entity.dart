import '../../../product/domain/entities/product_entity.dart';

class OrderItem {
  const OrderItem({required this.product, required this.quantity});

  final Product product;
  final int quantity;
}
