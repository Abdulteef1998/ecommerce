import 'package:ecomerece/utils/app_routes.dart';
import 'package:ecomerece/views/pages/custom_bottom_navbar.dart';
import 'package:ecomerece/views/pages/prudact_detaiils_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
            builder: (_) => CustomBottomNavbar(), settings: settings);
      case AppRoutes.productDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => PrudactDetailsPage(), settings: settings);
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
