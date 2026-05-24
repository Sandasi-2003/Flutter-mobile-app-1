import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import 'shop_models.dart';

class MockShopData {
  MockShopData._();

  static const List<OnboardingSlide> onboardingSlides = [
    OnboardingSlide(
      title: 'Your Shopping Destination for Everything',
      description:
          'Find fashion, furniture, gadgets, and daily essentials in one beautiful mobile store.',
      image: AppAssets.onboardingGrid,
    ),
    OnboardingSlide(
      title: 'Wishlist to Dream Product, in Just a Few Clicks',
      description:
          'Save favorites, compare choices, and come back when the time feels right.',
      image: AppAssets.onboardingPhone,
    ),
    OnboardingSlide(
      title: 'Swift and Reliable Delivery',
      description:
          'Track every order clearly from checkout to your front door.',
      image: AppAssets.onboardingDelivery,
    ),
  ];

  static const List<ProductCategory> categories = [
    ProductCategory(
      id: 'fashion',
      name: 'Fashion',
      iconAsset: AppAssets.iconTshirt,
    ),
    ProductCategory(id: 'shoes', name: 'Shoes', iconAsset: AppAssets.iconShoe),
    ProductCategory(
      id: 'furniture',
      name: 'Furniture',
      iconAsset: AppAssets.iconChair,
    ),
    ProductCategory(id: 'bags', name: 'Bags', iconAsset: AppAssets.iconHandbag),
    ProductCategory(id: 'watch', name: 'Watch', iconAsset: AppAssets.iconWatch),
    ProductCategory(
      id: 'beauty',
      name: 'Beauty',
      iconAsset: AppAssets.iconDress,
    ),
  ];

  static const List<Product> products = [
    Product(
      id: 'p1',
      name: 'Nike Pegasus 39',
      categoryId: 'shoes',
      brand: 'Nike',
      price: 120,
      oldPrice: 160,
      rating: 4.8,
      reviewCount: 126,
      image: AppAssets.productShoeBlack,
      description:
          'A lightweight everyday sneaker with soft cushioning, durable mesh, and a crisp street-ready silhouette.',
      colors: [Color(0xFF111827), Color(0xFFFF4553), Color(0xFF9CA3AF)],
      sizes: ['39', '40', '41', '42', '43'],
    ),
    Product(
      id: 'p2',
      name: 'Ha Pegasus 4.1',
      categoryId: 'shoes',
      brand: 'Ha',
      price: 98,
      oldPrice: 130,
      rating: 4.6,
      reviewCount: 84,
      image: AppAssets.productShoeBlue,
      description:
          'Breathable running profile with contrast trim and reliable grip for busy city days.',
      colors: [Color(0xFF2563EB), Color(0xFF111827), Color(0xFFFFFFFF)],
      sizes: ['38', '39', '40', '41', '42'],
    ),
    Product(
      id: 'p3',
      name: 'Light Brown Coat',
      categoryId: 'fashion',
      brand: 'Zara',
      price: 120,
      oldPrice: 180,
      rating: 4.5,
      reviewCount: 96,
      image: AppAssets.productCoatRed,
      description:
          'A soft tailored layer with a polished cut for workdays, weekends, and cool evenings.',
      colors: [Color(0xFFFF4553), Color(0xFFB45309), Color(0xFF111827)],
      sizes: ['S', 'M', 'L', 'XL'],
    ),
    Product(
      id: 'p4',
      name: 'Aury Chair',
      categoryId: 'furniture',
      brand: 'Furni',
      price: 100,
      oldPrice: 150,
      rating: 4.7,
      reviewCount: 64,
      image: AppAssets.productChairGray,
      description:
          'Modern lounge chair with angled legs, padded seat, and a compact footprint.',
      colors: [Color(0xFF6B7280), Color(0xFF111827), Color(0xFFFF4553)],
      sizes: ['One size'],
    ),
    Product(
      id: 'p5',
      name: 'Canon Camera Bag',
      categoryId: 'bags',
      brand: 'Canon',
      price: 130,
      oldPrice: 170,
      rating: 4.4,
      reviewCount: 42,
      image: AppAssets.productBagBlack,
      description:
          'Structured carry bag with padded storage, clean hardware, and a travel-friendly profile.',
      colors: [Color(0xFF111827), Color(0xFF4B5563)],
      sizes: ['Compact', 'Large'],
    ),
  ];

  static final List<CartItem> cartItems = [
    CartItem(product: products[2], quantity: 1),
    CartItem(product: products[0], quantity: 1),
  ];

  static const List<Coupon> coupons = [
    Coupon(
      code: 'WELCOME20',
      title: 'Welcome Offer',
      description: 'Get 20% off your first order.',
      discount: 20,
    ),
    Coupon(
      code: 'CASHBACK12',
      title: 'Wallet Cashback',
      description: 'Up to \$12 cashback on card payment.',
      discount: 12,
    ),
    Coupon(
      code: 'FREESHIP',
      title: 'Free Shipping',
      description: 'Shipping fee waived for this order.',
      discount: 8,
    ),
  ];

  static const List<Address> addresses = [
    Address(
      id: 'a1',
      label: 'Home',
      name: 'Sandasi',
      phone: '+94 77 123 4567',
      line: '25 Palm Street, Colombo 03',
    ),
    Address(
      id: 'a2',
      label: 'Office',
      name: 'Sandasi',
      phone: '+94 77 123 4567',
      line: 'Level 04, Lake Tower, Colombo 02',
    ),
    Address(
      id: 'a3',
      label: 'Parents House',
      name: 'Darlene Robertson',
      phone: '+94 76 900 4567',
      line: '12 Flower Road, Kandy',
    ),
  ];

  static const List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      id: 'card',
      title: 'Visa',
      subtitle: '**** 8047',
      iconAsset: AppAssets.iconCreditCard,
    ),
    PaymentMethod(
      id: 'paypal',
      title: 'PayPal',
      subtitle: 'sandasi@example.com',
      iconAsset: AppAssets.iconWalletSvg,
    ),
    PaymentMethod(
      id: 'cash',
      title: 'Cash on Delivery',
      subtitle: 'Pay when the order arrives',
      iconAsset: AppAssets.iconCash,
    ),
  ];

  static final List<Order> orders = [
    Order(
      id: '#EC-2048',
      status: 'Active',
      date: DateTime(2026, 5, 18),
      items: [OrderItem(product: products[3], quantity: 1)],
      total: 100,
    ),
    Order(
      id: '#EC-2032',
      status: 'Completed',
      date: DateTime(2026, 5, 10),
      items: [
        OrderItem(product: products[0], quantity: 1),
        OrderItem(product: products[2], quantity: 1),
      ],
      total: 240,
    ),
    Order(
      id: '#EC-1998',
      status: 'Canceled',
      date: DateTime(2026, 4, 28),
      items: [OrderItem(product: products[4], quantity: 1)],
      total: 130,
    ),
  ];

  static final List<Review> reviews = [
    Review(
      user: 'Cody Fisher',
      avatar: AppAssets.avatarUser,
      rating: 5,
      comment: 'Fast delivery and the product looks even better in hand.',
      date: DateTime(2026, 5, 12),
    ),
    Review(
      user: 'Jenny Wilson',
      avatar: AppAssets.profileEster,
      rating: 4,
      comment: 'Great quality for the price. Packaging was neat too.',
      date: DateTime(2026, 5, 8),
    ),
    Review(
      user: 'Albert Flores',
      avatar: AppAssets.avatarUser,
      rating: 5,
      comment: 'The color and fit match the photos. Recommended.',
      date: DateTime(2026, 5, 1),
    ),
  ];

  static const UserProfile user = UserProfile(
    name: 'Sandasi',
    email: 'sandasi.howard@example.com',
    phone: '+94 77 123 4567',
    avatar: AppAssets.profileEster,
  );
}
