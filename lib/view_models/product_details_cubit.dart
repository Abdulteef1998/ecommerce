import 'package:bloc/bloc.dart';
import 'package:ecomerece/models/Add_to_cart_model.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/prudact_item_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(BuildContext context) : super(ProductDetailsInitial());
  ProductSize? selectedSize;
  int quantity = 1;
  void getProductDetails(String id) {
    emit(ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 1), () {
      final selectedProduct = dummyProducts.firstWhere((item) => item.id == id);
      emit(ProductDetailsLoaded(productI: selectedProduct));
    });
  }

  void selectSize(ProductSize size) {
    selectedSize = size;
    emit(SizeSelected(size: size));
  }

  void addToCart(String prodctId) {
    emit(ProductAddingToCart());
    final cartItem = AddToCartModel(
        productId: prodctId, size: selectedSize!, qantity: quantity);
    dummyCart.add(cartItem);
    Future.delayed(const Duration(seconds: 1), () {
      emit(ProductAddToCart(productId: prodctId));
    });
  }

  void incrementCounter(String productId) {
    quantity++;
    emit(QuantityCounterLoaded(value: quantity));
  }

  void decrementCounter(String productId) {
    quantity--;
    emit(QuantityCounterLoaded(value: quantity));
  }
}
