import 'package:ecomerce_app/feature/account/presentation/screen/profile_screen.dart';
import 'package:ecomerce_app/feature/home/presentation/screen/home_screen.dart';
import 'package:ecomerce_app/feature/onboading/onboading_screen.dart';
import 'package:ecomerce_app/feature/splash/splash_page.dart';
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
      case AppRoute.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case AppRoute.explore:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoute.favorite:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoute.cart:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoute.account:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
