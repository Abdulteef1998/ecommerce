import 'package:ecomerece/utils/app_colors.dart';
import 'package:ecomerece/view_models/cart_cubit/cart_cubit.dart';
import 'package:ecomerece/view_models/cart_cubit/cart_state.dart';
import 'package:ecomerece/views/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = CartCubit();
        cubit.getCartItems();
        return cubit;
      },
      child: Builder(
        builder: (context) {
          return BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is CartLoaded) {
                final cartItems = state.cartItems;
                if (cartItems.isEmpty) {
                  return const Center(child: Text('No Items In Your Cart!'));
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CartItemWidget(cartItem: cartItems[index]);
                        },
                        itemCount: cartItems.length,
                        separatorBuilder: (context, index) {
                          return Divider(color: AppColors.grey2);
                        },
                      ),
                      Divider(color: AppColors.grey2),
                      totalAndSubTotalWidget(context,
                          title: 'Subtotal', amount: state.subtotal),
                      totalAndSubTotalWidget(context,
                          title: 'Shipping', amount: 10),
                      const SizedBox(height: 4),
                      Dash(
                        dashColor: AppColors.grey3,
                        length: MediaQuery.of(context).size.width - 32,
                      ),
                      const SizedBox(height: 4),
                      totalAndSubTotalWidget(context,
                          title: 'Total Amount', amount: state.subtotal + 10),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: AppColors.white),
                            child: const Text("Checkout"),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text('Something went wrong'));
              }
            },
          );
        },
      ),
    );
  }
}

Widget totalAndSubTotalWidget(BuildContext context,
    {required String title, required double amount}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.grey),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    ),
  );
}
