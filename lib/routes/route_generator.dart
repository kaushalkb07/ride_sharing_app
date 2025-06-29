import 'package:flutter/material.dart';
import 'package:ride_sharing_app/views/historypage.dart';
import 'package:ride_sharing_app/views/homepage.dart';
import 'package:ride_sharing_app/views/offerpage.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.history:
        return MaterialPageRoute(builder: (_) => const HistoryPage());
      case AppRoutes.offers:
        return MaterialPageRoute(builder: (_) => const OfferPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
