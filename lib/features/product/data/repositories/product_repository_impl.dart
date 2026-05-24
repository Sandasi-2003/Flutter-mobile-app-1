import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../shared/models/shop_models.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl({required this.remoteDataSource});

  final ProductRemoteDataSource remoteDataSource;

  @override
  Future<ProductCatalog> getProducts() async {
    final Map<String, dynamic> data = await remoteDataSource.getProducts();
    final List<dynamic> rawProducts = data['products'] as List<dynamic>? ?? [];
    final List<Product> products = rawProducts
        .whereType<Map<dynamic, dynamic>>()
        .map((json) => _mapProduct(Map<String, dynamic>.from(json)))
        .toList();

    return ProductCatalog(
      products: products,
      categories: _buildCategories(products),
    );
  }

  Product _mapProduct(Map<String, dynamic> json) {
    final double price = _toDouble(json['price']);
    final double discount = _toDouble(json['discountPercentage']);
    final String category = _toString(json['category'], fallback: 'products');
    final String image = _resolveImage(json);

    return Product(
      id: _toString(json['id']),
      name: _toString(json['title'], fallback: 'Untitled Product'),
      categoryId: category,
      brand: _toString(json['brand'], fallback: _formatCategory(category)),
      price: price,
      oldPrice: _oldPrice(price, discount),
      rating: _toDouble(json['rating']),
      reviewCount: (json['reviews'] as List<dynamic>?)?.length ?? 0,
      image: image,
      description: _toString(json['description']),
      colors: _colorsForCategory(category),
      sizes: _sizesForCategory(category),
      reviews: _mapReviews(json['reviews']),
    );
  }

  List<Review> _mapReviews(dynamic value) {
    final List<dynamic> rawReviews = value as List<dynamic>? ?? [];
    return rawReviews.whereType<Map<dynamic, dynamic>>().map((json) {
      final Map<String, dynamic> review = Map<String, dynamic>.from(json);
      return Review(
        user: _toString(review['reviewerName'], fallback: 'Customer'),
        avatar: AppAssets.avatarPlaceholder,
        rating: _toDouble(review['rating']),
        comment: _toString(review['comment']),
        date: DateTime.tryParse(_toString(review['date'])) ?? DateTime.now(),
      );
    }).toList();
  }

  List<ProductCategory> _buildCategories(List<Product> products) {
    final Set<String> slugs = products
        .map((product) => product.categoryId)
        .toSet();
    return slugs.map((slug) {
      return ProductCategory(
        id: slug,
        name: _formatCategory(slug),
        iconAsset: _iconForCategory(slug),
      );
    }).toList()..sort((a, b) => a.name.compareTo(b.name));
  }

  String _resolveImage(Map<String, dynamic> json) {
    final String thumbnail = _toString(json['thumbnail']);
    if (thumbnail.isNotEmpty) return thumbnail;

    final List<dynamic> images = json['images'] as List<dynamic>? ?? [];
    if (images.isNotEmpty) return _toString(images.first);

    return AppAssets.placeholder;
  }

  double _oldPrice(double price, double discount) {
    if (discount <= 0 || discount >= 100) return price;
    return price / (1 - (discount / 100));
  }

  String _formatCategory(String value) {
    return value
        .split('-')
        .where((part) => part.isNotEmpty)
        .map((part) => '${part[0].toUpperCase()}${part.substring(1)}')
        .join(' ');
  }

  String _iconForCategory(String category) {
    if (category.contains('shoe')) return AppAssets.iconShoe;
    if (category.contains('watch')) return AppAssets.iconWatch;
    if (category.contains('bag')) return AppAssets.iconHandbag;
    if (category.contains('dress')) return AppAssets.iconDress;
    if (category.contains('shirt') || category.contains('top')) {
      return AppAssets.iconTshirt;
    }
    if (category.contains('furniture') || category.contains('chair')) {
      return AppAssets.iconChair;
    }
    if (category.contains('beauty') || category.contains('skin')) {
      return AppAssets.iconDress;
    }
    return AppAssets.iconProduct;
  }

  List<Color> _colorsForCategory(String category) {
    if (category.contains('beauty')) {
      return const [Color(0xFFFF8FA3), Color(0xFFFF4553), Color(0xFFFFD6DA)];
    }
    if (category.contains('furniture')) {
      return const [Color(0xFF6B7280), Color(0xFF111827), Color(0xFFD6A76C)];
    }
    return const [Color(0xFF111827), Color(0xFFFF4553), Color(0xFFFFFFFF)];
  }

  List<String> _sizesForCategory(String category) {
    if (category.contains('shoe')) return const ['39', '40', '41', '42', '43'];
    if (category.contains('shirt') ||
        category.contains('dress') ||
        category.contains('top')) {
      return const ['S', 'M', 'L', 'XL'];
    }
    return const ['One size'];
  }

  String _toString(dynamic value, {String fallback = ''}) {
    if (value == null) return fallback;
    final String text = value.toString();
    return text.trim().isEmpty ? fallback : text;
  }

  double _toDouble(dynamic value) {
    if (value is num) return value.toDouble();
    return double.tryParse(value?.toString() ?? '') ?? 0;
  }
}

class DummyJsonProductRepository extends ProductRepositoryImpl {
  const DummyJsonProductRepository({required super.remoteDataSource});
}
