import 'package:ecomerce_app/feature/onboading/onboading_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecomerce_app/feature/auth/presentation/screen/login_screen.dart';
import 'package:ecomerce_app/core/routing/app_route.dart';

class AppPageRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.onboard:
        return MaterialPageRoute(builder: (_) => OnboadingScreen());
      case AppRoute.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
