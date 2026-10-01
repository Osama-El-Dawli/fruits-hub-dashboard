import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_products/domain/entities/review_entity.dart';

class AddProductInputEntity {
  final String name, code, description;
  final num price;
  final bool isFeatured;
  final File image;
  String? imageUrl;
  final int expirationInMonths;
  final int numberOfCallories;
  final int unitAmount;
  final bool isOrganic;
  final num avgRating = 0;
  final num ratingCount = 0;
  final List<ReviewEntity> reviews;

  new({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    this.isFeatured = false,
    required this.image,
    required this.expirationInMonths,
    required this.numberOfCallories,
    required this.unitAmount,
    required this.reviews,
    this.isOrganic = false,
    this.imageUrl,
  });
}
