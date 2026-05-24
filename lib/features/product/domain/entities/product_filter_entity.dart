class ProductFilter {
  const ProductFilter({this.categoryId, this.query, this.minimumRating});

  final String? categoryId;
  final String? query;
  final double? minimumRating;
}
