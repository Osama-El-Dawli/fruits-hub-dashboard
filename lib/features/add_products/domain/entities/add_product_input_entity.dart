import 'dart:io';

class AddProductInputEntity {
  final String name, code, description;
  final num price;
  final bool isFeatured;
  final File image;
  final String? imageUrl;

  new({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    required this.image,
    this.imageUrl,
  });
}
