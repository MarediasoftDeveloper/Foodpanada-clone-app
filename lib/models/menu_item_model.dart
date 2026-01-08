class MenuItemModel {
  final String id;
  final String title;
  final double price;
  final String description;
  final String image;

  MenuItemModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });
}

// models/review_model.dart
class ReviewModel {
  final String userName;
  final String comment;
  final double rating;
  final String timeAgo;

  ReviewModel({
    required this.userName,
    required this.comment,
    required this.rating,
    required this.timeAgo,
  });
}
