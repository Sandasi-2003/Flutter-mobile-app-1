import 'package:flutter/foundation.dart';

import '../../../../shared/models/mock_shop_data.dart';
import '../../../../shared/models/shop_models.dart';
import '../../../product/domain/repositories/product_repository.dart';

class MainProvider extends ChangeNotifier {
  MainProvider({ProductRepository? productRepository})
    : _productRepository = productRepository,
      _products = productRepository == null
          ? List<Product>.from(MockShopData.products)
          : <Product>[],
      _categories = productRepository == null
          ? List<ProductCategory>.from(MockShopData.categories)
          : <ProductCategory>[],
      _cartItems = productRepository == null
          ? List<CartItem>.from(MockShopData.cartItems)
          : <CartItem>[],
      _favoriteIds = productRepository == null ? {'p1', 'p3'} : <String>{};

  final ProductRepository? _productRepository;
  List<Product> _products;
  List<ProductCategory> _categories;
  final List<CartItem> _cartItems;
  final Set<String> _favoriteIds;
  String _selectedAddressId = MockShopData.addresses.first.id;
  String _selectedPaymentId = MockShopData.paymentMethods.first.id;
  String _selectedDelivery = 'Regular';
  Coupon? _coupon;
  bool _isLoadingProducts = false;
  String? _productsError;

  List<ProductCategory> get categories => List.unmodifiable(_categories);
  List<Product> get products => List.unmodifiable(_products);
  List<CartItem> get cartItems => List.unmodifiable(_cartItems);
  List<Product> get favorites =>
      products.where((product) => _favoriteIds.contains(product.id)).toList();
  List<Address> get addresses => MockShopData.addresses;
  List<PaymentMethod> get paymentMethods => MockShopData.paymentMethods;
  List<Order> get orders => MockShopData.orders;
  List<Coupon> get coupons => MockShopData.coupons;
  List<Review> get reviews {
    final Product? favoriteProduct = _products
        .where((product) => product.reviews.isNotEmpty)
        .firstOrNull;
    return favoriteProduct?.reviews ?? MockShopData.reviews;
  }

  UserProfile get user => MockShopData.user;
  bool get isLoadingProducts => _isLoadingProducts;
  String? get productsError => _productsError;

  String get selectedAddressId => _selectedAddressId;
  String get selectedPaymentId => _selectedPaymentId;
  String get selectedDelivery => _selectedDelivery;
  Coupon? get coupon => _coupon;

  double get subtotal => _cartItems.fold(
    0,
    (sum, item) => sum + item.product.price * item.quantity,
  );
  double get shipping => _selectedDelivery == 'Express' ? 15 : 8;
  double get discount => _coupon?.discount ?? 0;
  double get total =>
      (subtotal + shipping - discount).clamp(0, double.infinity);

  bool isFavorite(String productId) => _favoriteIds.contains(productId);

  Future<void> loadProducts() async {
    final ProductRepository? repository = _productRepository;
    if (repository == null || _isLoadingProducts) return;

    _isLoadingProducts = true;
    _productsError = null;
    notifyListeners();

    try {
      final ProductCatalog catalog = await repository.getProducts();
      if (catalog.products.isNotEmpty) {
        _products = catalog.products;
      }
      if (catalog.categories.isNotEmpty) {
        _categories = catalog.categories;
      }
    } catch (error) {
      _productsError = 'Unable to load products. Showing offline data.';
    } finally {
      _isLoadingProducts = false;
      notifyListeners();
    }
  }

  Product productById(String productId) {
    if (products.isEmpty) return MockShopData.products.first;

    return products.firstWhere(
      (product) => product.id == productId,
      orElse: () => products.first,
    );
  }

  List<Product> productsByCategory(String categoryId) {
    return products
        .where((product) => product.categoryId == categoryId)
        .toList();
  }

  String categoryName(String categoryId) {
    return _categories
        .firstWhere(
          (category) => category.id == categoryId,
          orElse: () => ProductCategory(
            id: categoryId,
            name: categoryId,
            iconAsset: MockShopData.categories.first.iconAsset,
          ),
        )
        .name;
  }

  List<Product> searchProducts(String query) {
    final String term = query.trim().toLowerCase();
    if (term.isEmpty) return products;
    return products.where((product) {
      return product.name.toLowerCase().contains(term) ||
          product.brand.toLowerCase().contains(term) ||
          product.categoryId.toLowerCase().contains(term);
    }).toList();
  }

  void toggleFavorite(String productId) {
    if (_favoriteIds.contains(productId)) {
      _favoriteIds.remove(productId);
    } else {
      _favoriteIds.add(productId);
    }
    notifyListeners();
  }

  void addToCart(Product product) {
    final int index = _cartItems.indexWhere(
      (item) => item.product.id == product.id,
    );
    if (index == -1) {
      _cartItems.add(CartItem(product: product, quantity: 1));
    } else {
      _cartItems[index] = _cartItems[index].copyWith(
        quantity: _cartItems[index].quantity + 1,
      );
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _cartItems.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void changeQuantity(String productId, int delta) {
    final int index = _cartItems.indexWhere(
      (item) => item.product.id == productId,
    );
    if (index == -1) return;
    final int next = _cartItems[index].quantity + delta;
    if (next <= 0) {
      _cartItems.removeAt(index);
    } else {
      _cartItems[index] = _cartItems[index].copyWith(quantity: next);
    }
    notifyListeners();
  }

  void selectAddress(String addressId) {
    _selectedAddressId = addressId;
    notifyListeners();
  }

  void selectPayment(String paymentId) {
    _selectedPaymentId = paymentId;
    notifyListeners();
  }

  void selectDelivery(String delivery) {
    _selectedDelivery = delivery;
    notifyListeners();
  }

  void applyCoupon(Coupon coupon) {
    _coupon = coupon;
    notifyListeners();
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull {
    final Iterator<T> iterator = this.iterator;
    if (!iterator.moveNext()) return null;
    return iterator.current;
  }
}
