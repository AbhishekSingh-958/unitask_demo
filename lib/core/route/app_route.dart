import 'package:flutter/material.dart';
import 'package:unitask_demo/src/features/home/view/home_main_screen.dart';

abstract class AppRoutes {
  AppRoutes._();
}

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? route = settings.name;
    switch (route) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeMainScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
          settings: settings,
        );
    }
  }
}
