import 'package:flutter/material.dart';

class OrderStatusChip extends StatelessWidget {
  const OrderStatusChip({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(status));
  }
}
