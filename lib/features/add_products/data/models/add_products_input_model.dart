import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_products/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
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
    this.imageUrl,
    this.isOrganic = false,
  });

  factory AddProductInputModel.fromEntity(AddProductInputEntity entity) {
    return AddProductInputModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      isFeatured: entity.isFeatured,
      image: entity.image,
      expirationInMonths: entity.expirationInMonths,
      numberOfCallories: entity.numberOfCallories,
      unitAmount: entity.unitAmount,
      imageUrl: entity.imageUrl,
      isOrganic: entity.isOrganic,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'code': code,
    'description': description,
    'price': price,
    'isFeatured': isFeatured,
    'expirationInMonths': expirationInMonths,
    'numberOfCallories': numberOfCallories,
    'unitAmount': unitAmount,
    'isOrganic': isOrganic,
    'avgRating': avgRating,
    'ratingCount': ratingCount,
    'imageUrl': imageUrl,
  };
}
