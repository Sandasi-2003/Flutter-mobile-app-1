class Review {
  const Review({
    required this.user,
    required this.avatar,
    required this.rating,
    required this.comment,
    required this.date,
  });

  final String user;
  final String avatar;
  final double rating;
  final String comment;
  final DateTime date;
}
