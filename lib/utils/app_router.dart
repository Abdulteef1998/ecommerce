import 'package:ecomerece/utils/app_routes.dart';
import 'package:ecomerece/views/pages/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_models/product_details_cubit.dart';
import '../views/pages/prudact_detaiils_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
            builder: (_) => const CustomBottomNavbar(), settings: settings);
      case AppRoutes.productDetailsRoute:
        final String productId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ProductDetailsCubit>(
            create: (context) {
              final cubit = ProductDetailsCubit(context);
              cubit.getProductDetails(productId);
              return cubit;
            },
            child: PrudactDetailsPage(
              productId: productId,
            ),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
