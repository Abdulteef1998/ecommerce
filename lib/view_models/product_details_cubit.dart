import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/prudact_item_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(BuildContext context) : super(ProductDetailsInitial());

  void getProductDetails(String id) {
    emit(ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 1), () {
      final selectedProduct = dummyProducts.firstWhere((item) => item.id == id);
      emit(ProductDetailsLoaded(productI: selectedProduct));
    });
  }

  void selectSize(ProductSize size) {
    emit(SizeSelected(size: size));
  }

  void incrementCounter(String productId) {
    final selectedIndex =
        dummyProducts.indexWhere((item) => item.id == productId);
    dummyProducts[selectedIndex] = dummyProducts[selectedIndex]
        .copyWith(qantity: dummyProducts[selectedIndex].qantity + 1);
    emit(QuantityCounterLoaded(value: dummyProducts[selectedIndex].qantity));
  }

  void decrementCounter(String productId) {
    final selectedIndex =
        dummyProducts.indexWhere((item) => item.id == productId);
    dummyProducts[selectedIndex] = dummyProducts[selectedIndex]
        .copyWith(qantity: dummyProducts[selectedIndex].qantity - 1);
    emit(QuantityCounterLoaded(value: dummyProducts[selectedIndex].qantity));
  }
}
