class Coupon {
  const Coupon({
    required this.code,
    required this.title,
    required this.description,
    required this.discount,
  });

  final String code;
  final String title;
  final String description;
  final double discount;
}

class Checkout {
  const Checkout({
    required this.subtotal,
    required this.shipping,
    required this.total,
  });

  final double subtotal;
  final double shipping;
  final double total;
}
