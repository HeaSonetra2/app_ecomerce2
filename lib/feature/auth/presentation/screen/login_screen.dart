import 'package:ecomerce_app/feature/auth/presentation/bloc/bloc.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/state.dart';
import 'package:ecomerce_app/feature/auth/presentation/screen/register_screen.dart';
import 'package:ecomerce_app/feature/auth/presentation/screen/reset_password_screen.dart';
import 'package:ecomerce_app/feature/auth/presentation/widget/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Image.asset('assets/logo/logo2.png'),
          SizedBox(height: 20),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Welcome To Homepage')));
              }
              if (state is AuthError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Error')));
              }
            },
            child: LoginForm(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Do you have an acount?'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  'Register',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgotPassword()),
              );
            },
            child: Text(
              'FogotPassword',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(height: 200),
        ],
      ),
    );
  }
}
