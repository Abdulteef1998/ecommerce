// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecomerece/models/prudact_item_model.dart';

class AddToCartModel {
  final String productId;
  final ProductSize size;
  final int qantity;

  AddToCartModel(
      {required this.productId, required this.size, required this.qantity});

  AddToCartModel copyWith({
    String? productId,
    ProductSize? size,
    int? qantity,
  }) {
    return AddToCartModel(
      productId: productId ?? this.productId,
      size: size ?? this.size,
      qantity: qantity ?? this.qantity,
    );
  }
}

List<AddToCartModel> dummyCart = [];
