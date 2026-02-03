import 'package:ecomerce_app/core/routing/app_route.dart';
import 'package:ecomerce_app/core/storage/token_storage.dart';
import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:ecomerce_app/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

TokenStorage tokenStorage = TokenStorage();

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Profile',
          style: AppTextStyle.heading3.copyWith(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                tokenStorage.clearCache();
                Navigator.pushNamed(context, AppRoute.login);
              },
              child: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
