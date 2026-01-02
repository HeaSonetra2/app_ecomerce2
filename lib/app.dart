import 'package:ecomerce_app/core/routing/app_route.dart';
import 'package:ecomerce_app/core/routing/page_route.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      initialRoute: AppRoute.onboard, // or AppRoute.onboard
      onGenerateRoute:
          AppPageRoute.generateRoute, // <-- THIS works because it's static
    );
  }
}
