import 'package:bloc/bloc.dart';

import '../models/prudact_item_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void getProductDetails(String id) {
    emit(ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 1), () {
      final selectedProduct =
          dummyPrudactIs.firstWhere((item) => item.id == id);
      emit(ProductDetailsLoaded(productI: selectedProduct));
    });
  }

  void incrementCounter(String productId) {
    final selectedIndex =
        dummyPrudactIs.indexWhere((item) => item.id == productId);
    dummyPrudactIs[selectedIndex] = dummyPrudactIs[selectedIndex]
        .copyWith(qantity: dummyPrudactIs[selectedIndex].qantity + 1);
    emit(QuantityCounterLoaded(value: dummyPrudactIs[selectedIndex].qantity));
  }

  void decrementCounter(String productId) {
    final selectedIndex =
        dummyPrudactIs.indexWhere((item) => item.id == productId);
    dummyPrudactIs[selectedIndex] = dummyPrudactIs[selectedIndex]
        .copyWith(qantity: dummyPrudactIs[selectedIndex].qantity - 1);
    emit(QuantityCounterLoaded(value: dummyPrudactIs[selectedIndex].qantity));
  }
}
