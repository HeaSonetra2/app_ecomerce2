import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OnboadingScreen extends StatelessWidget {
  const OnboadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/onboad_image.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.primary, AppColors.teritery],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 200,
                    color: AppColors.primary,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 200,
            left: 100,
            child: Container(child: Image.asset('assets/logo/logo_app.png')),
          ),
        ],
      ),
    );
  }
}
