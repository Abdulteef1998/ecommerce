import 'package:ecomerece/models/Add_to_cart_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CartState {
  const CartState();
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<AddToCartModel> cartItems;
  final double subtotal;

  const CartLoaded(this.cartItems, this.subtotal);
}

class CartError extends CartState {
  final String message;
  const CartError(this.message);
}
