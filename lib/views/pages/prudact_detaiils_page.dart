import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerece/utils/app_colors.dart';
import 'package:ecomerece/view_models/product_details_cubit.dart';
import 'package:ecomerece/views/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrudactDetailsPage extends StatelessWidget {
  final String productId;

  const PrudactDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (previous, current) => current is! QuantityCounterLoaded,
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        if (state is ProductDetailsError) {
          return Scaffold(body: Center(child: Text(state.message)));
        } else if (state is ProductDetailsLoaded) {
          final product = state.productI;
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  title: Text('Proudact Details'),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border))
                  ]),
              body: Stack(
                children: [
                  Container(
                    height: size.height * 0.52,
                    decoration: BoxDecoration(color: AppColors.grey2),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.1,
                          width: double.infinity,
                        ),
                        CachedNetworkImage(
                          imageUrl: product.imgUrl,
                          width: double.infinity,
                          height: size.height * 0.4,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.47),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(36),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: AppColors.yellow,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          product.averageRate.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                BlocBuilder<ProductDetailsCubit,
                                    ProductDetailsState>(
                                  bloc: BlocProvider.of<ProductDetailsCubit>(
                                      context),
                                  buildWhen: (previous, current) =>
                                      current is QuantityCounterLoaded ||
                                      current is ProductDetailsLoaded,
                                  builder: (context, state) {
                                    if (state is QuantityCounterLoaded) {
                                      return CounterWidget(
                                        value: state.value,
                                        productId: product.id,
                                        cubit: BlocProvider.of<
                                            ProductDetailsCubit>(context),
                                      );
                                    } else if (state is ProductDetailsLoaded) {
                                      return CounterWidget(
                                          value: state.productI.qantity,
                                          productId: product.id,
                                          cubit: BlocProvider.of<
                                              ProductDetailsCubit>(context));
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        } else {
          return Scaffold(
            body: Center(
              child: Text('Something went worng'),
            ),
          );
        }
      },
    );
  }
}
