import 'package:flutter/material.dart';
import 'package:foodpanda_clone/views/dashboard/dashboard_view.dart';
import 'package:foodpanda_clone/views/home/home_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
     case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardView());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
