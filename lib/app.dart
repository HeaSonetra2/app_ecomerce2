import 'package:ecomerce_app/core/injection/injection.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/bloc.dart';
import 'package:ecomerce_app/feature/auth/presentation/screen/login_screen.dart';
import 'package:ecomerce_app/feature/onboading/onboading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: BlocProvider(
    //     create: (_)=>sl<AuthBloc>(),
    //     child:OnboadingScreen()
    //   ),
    // );
    return BlocProvider(
      create: (_) => sl<AuthBloc>(),
      child: MaterialApp(
        home: OnboadingScreen(),
      ),
    );
  }
}
