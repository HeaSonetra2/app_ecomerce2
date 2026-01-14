import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:ecomerce_app/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('assets/logo/logo2.png')],
              ),
              SizedBox(height: 24),
              _buildInputField(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildInputField() {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: AppColors.colorbgFieldInput,
    ),
    child: Row(
      children: [
        SizedBox(width: 8),
        Icon(Icons.search),
        SizedBox(width: 8),
        Text('Search store', style: AppTextStyle.smallGrey),
      ],
    ),
  );
}
