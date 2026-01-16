import 'package:ecomerce_app/core/injection/injection.dart';
import 'package:ecomerce_app/core/routing/app_route.dart';
import 'package:ecomerce_app/core/routing/page_route.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/bloc.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (_) => sl<AuthBloc>(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     initialRoute: AppRoute.onboard,
    //     onGenerateRoute: AppPageRoute.generateRoute,
    //   ),
    // );
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: sl<AuthBloc>()),
        BlocProvider.value(value: sl<HomeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.onboard,
        onGenerateRoute: AppPageRoute.generateRoute,
      ),
    );
  }
}
