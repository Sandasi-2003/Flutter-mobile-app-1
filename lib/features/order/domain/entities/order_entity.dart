import 'order_item_entity.dart';

class Order {
  const Order({
    required this.id,
    required this.status,
    required this.date,
    required this.items,
    required this.total,
  });

  final String id;
  final String status;
  final DateTime date;
  final List<OrderItem> items;
  final double total;
}
