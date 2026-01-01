import 'package:ecomerce_app/core/routing/app_route.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      initialRoute: AppRoute.login, // or AppRoute.onboard
      onGenerateRoute:
          PageRoute.generateRoute, // <-- THIS works because it's static
    );
  }
}
