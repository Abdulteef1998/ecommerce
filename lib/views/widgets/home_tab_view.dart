import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerece/models/home_carosel_item_model.dart';
import 'package:ecomerece/utils/app_routes.dart';
import 'package:ecomerece/view_models/home_cubit/home_cubit.dart';
import 'package:ecomerece/views/widgets/prudact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else if (state is HomeLoaded) {
        return SingleChildScrollView(
          child: Column(
            children: [
              FlutterCarousel.builder(
                options: FlutterCarouselOptions(
                  height: 200,
                  showIndicator: true,
                  slideIndicator: CircularWaveSlideIndicator(),
                  autoPlay: true,
                ),
                itemCount: state.carouselItems.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: dummyHomeCarouselItems[itemIndex].imgUrl,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'New Airrvals ',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'See All ',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () => Navigator.of(context, rootNavigator: true)
                          .pushNamed(AppRoutes.productDetailsRoute,
                              arguments: state.products[index].id),
                      child: PrudactItem(productItem: state.products[index]));
                },
              ),
            ],
          ),
        );
      } else if (state is HomeError) {
        return Center(
          child: Text(
            state.message,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        );
      } else {
        return SizedBox.shrink();
      }
    });
  }
}
