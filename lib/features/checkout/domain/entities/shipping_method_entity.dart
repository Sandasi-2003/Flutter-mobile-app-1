class ShippingMethod {
  const ShippingMethod({
    required this.id,
    required this.title,
    required this.estimatedArrival,
    required this.price,
  });

  final String id;
  final String title;
  final String estimatedArrival;
  final double price;
}
