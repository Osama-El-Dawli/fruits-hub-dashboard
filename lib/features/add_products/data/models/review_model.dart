import 'package:fruits_hub_dashboard/features/add_products/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String reviewDescription;
  final num rating;
  final String date;

  new({
    required this.name,
    required this.image,
    required this.reviewDescription,
    required this.rating,
    required this.date,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      image: entity.image,
      reviewDescription: entity.reviewDescription,
      rating: entity.rating,
      date: entity.date,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    name: json['name'],
    image: json['image'],
    reviewDescription: json['reviewDescription'],
    rating: json['rating'],
    date: json['date'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
    'reviewDescription': reviewDescription,
    'rating': rating,
    'date': date,
  };
}
