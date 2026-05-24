import 'package:flutter/material.dart';

import 'product_review_entity.dart';

class Product {
  const Product({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.brand,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.reviewCount,
    required this.image,
    required this.description,
    required this.colors,
    required this.sizes,
    this.reviews = const [],
  });

  final String id;
  final String name;
  final String categoryId;
  final String brand;
  final double price;
  final double oldPrice;
  final double rating;
  final int reviewCount;
  final String image;
  final String description;
  final List<Color> colors;
  final List<String> sizes;
  final List<Review> reviews;
}
