import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerece/models/Add_to_cart_model.dart';
import 'package:ecomerece/utils/app_colors.dart';
import 'package:ecomerece/view_models/cart_cubit/cart_cubit.dart';
import 'package:ecomerece/views/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final AddToCartModel cartItem;

  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.grey2,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CachedNetworkImage(
              imageUrl: cartItem.product.imgUrl,
              height: 125,
              width: 125,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text.rich(
                  TextSpan(
                    text: "Size: ",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.grey,
                        ),
                    children: [
                      TextSpan(
                        text: " ${cartItem.size}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CounterWidget(
                      value: cartItem.quantity,
                      productId: cartItem.product.id,
                      cubit: cubit,
                    ),
                    Text(
                      '\$${cartItem.totalPrice.toStringAsFixed(1)}',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
