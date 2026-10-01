part of 'add_products_cubit.dart';

@immutable
sealed class AddProductsState {}

final class AddProductsInitial extends AddProductsState {}

final class AddProductsLoading extends AddProductsState {}

final class AddProductsSuccess extends AddProductsState {}

final class AddProductsFailure extends AddProductsState {
  final String errorMessage;

  new({required this.errorMessage});
}
