import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/features/add_products/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_products_state.dart';

class AddProductsCubit extends Cubit<AddProductsState> {
  AddProductsCubit({required this._imagesRepo, required this._productRepo})
    : super(AddProductsInitial());
  final ImagesRepo _imagesRepo;
  final ProductRepo _productRepo;

  Future<void> addProduct({
    required AddProductInputEntity addProductInputEntity,
  }) async {
    emit(AddProductsLoading());
    var result = await _imagesRepo.uploadImage(addProductInputEntity.image);

    result.fold((f) => emit(AddProductsFailure(errorMessage: f.message)), (
      imageUrl,
    ) async {
      addProductInputEntity.imageUrl = imageUrl;
      var result = await _productRepo.addProduct(addProductInputEntity);

      result.fold((fail) => emit(AddProductsFailure(errorMessage: fail.message)), (
        success,
      ) {
        emit(AddProductsSuccess());
      });
    });
  }
}
