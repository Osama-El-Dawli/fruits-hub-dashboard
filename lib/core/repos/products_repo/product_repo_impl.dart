import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/services/data_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruits_hub_dashboard/features/add_products/data/models/add_products_input_model.dart';
import 'package:fruits_hub_dashboard/features/add_products/domain/entities/add_product_input_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService _databaseService;

  new({required this._databaseService});

  @override
  Future<Either<Failure, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) async {
    try {
      await _databaseService.addData(
        path: BackendEndPoints.addProductsCollection,
        data: AddProductInputModel.fromEntity(addProductInputEntity).toJson(),
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product'));
    }
  }
}
