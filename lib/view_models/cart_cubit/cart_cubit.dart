// import 'package:bloc/bloc.dart';
// import 'package:ecomerece/models/Add_to_cart_model.dart';
// import 'package:ecomerece/view_models/cart_cubit/cart_state.dart';

// class CartCubit extends Cubit<CartState> {
//   // List<AddToCartModel> cartItems = [];
//   int quantity = 1;
//   CartCubit() : super(CartInitial());

//   void getCartItems() async {
//     emit(CartLoading());
//     final subTotal = dummyCart.fold<double>(
//         0, (previousValue, item) => previousValue + item.product.price);

//     emit(CartLoaded(dummyCart, subTotal));
//   }

//   void incrementCounter(String productId, [int? initialValue]) {
//     // final index = cartItems.indexWhere((item) => item.product.id == productId);
//     // if (index != -1) {
//     //   cartItems[index] =
//     //       cartItems[index].copyWith(quantity: cartItems[index].quantity + 1);
//     //   emit(CartLoaded(List.from(cartItems))); // إعادة تحميل القائمة
//     // }
//     if (initialValue != null) {
//       quantity = initialValue;
//     }
//     quantity++;
//   }

//   void decrementCounter(String productId) {
//     final index = cartItems.indexWhere((item) => item.product.id == productId);
//     if (index != -1 && cartItems[index].quantity > 1) {
//       cartItems[index] =
//           cartItems[index].copyWith(quantity: cartItems[index].quantity - 1);
//       emit(CartLoaded(List.from(cartItems))); // إعادة تحميل القائمة
//     }
//   }
// }
import 'package:bloc/bloc.dart';
import 'package:ecomerece/models/Add_to_cart_model.dart';
import 'package:ecomerece/view_models/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  List<AddToCartModel> cartItems = [];
  int quantity = 1;

  CartCubit() : super(CartInitial());

  void getCartItems() async {
    emit(CartLoading());

    // Ensure cartItems is initialized
    if (cartItems.isEmpty) {
      cartItems = List.from(dummyCart);
    }

    final subTotal = cartItems.fold<double>(
      0,
      (previousValue, item) =>
          previousValue + (item.product.price * item.quantity),
    );

    emit(CartLoaded(cartItems, subTotal));
  }

  void incrementCounter(String productId, [int? initialValue]) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      cartItems[index] =
          cartItems[index].copyWith(quantity: cartItems[index].quantity + 1);
      _updateCartState();
    }
  }

  void decrementCounter(String productId) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index != -1 && cartItems[index].quantity > 1) {
      cartItems[index] =
          cartItems[index].copyWith(quantity: cartItems[index].quantity - 1);
      _updateCartState();
    }
  }

  void _updateCartState() {
    final subTotal = cartItems.fold<double>(
      0,
      (previousValue, item) =>
          previousValue + (item.product.price * item.quantity),
    );

    emit(CartLoaded(List.from(cartItems), subTotal));
  }
}
