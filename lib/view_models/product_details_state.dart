part of 'product_details_cubit.dart';

sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsLoaded extends ProductDetailsState {
  final ProductItemModel productI;

  ProductDetailsLoaded({required this.productI});
}

final class QuantityCounterLoaded extends ProductDetailsState {
  final int value;

  QuantityCounterLoaded({required this.value});
}

final class ProductAddToCart extends ProductDetailsState {
  final String productId;

  ProductAddToCart({required this.productId});
}

final class ProductAddingToCart extends ProductDetailsState {
   
   
}
final class SizeSelected extends ProductDetailsState {
  final ProductSize size;

  SizeSelected({required this.size});
}

final class ProductDetailsError extends ProductDetailsState {
  final String message;

  ProductDetailsError({required this.message});
}
