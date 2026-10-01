import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/features/add_products/domain/entities/add_product_input_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct(AddProductInputEntity addProductInputEntity,
  );
}