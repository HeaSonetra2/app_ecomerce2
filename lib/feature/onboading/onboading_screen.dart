import 'package:ecomerce_app/core/storage/token_storage.dart';
import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:ecomerce_app/core/theme/text_style.dart';
import 'package:ecomerce_app/feature/auth/presentation/screen/login_screen.dart';
import 'package:ecomerce_app/feature/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';

class OnboadingScreen extends StatefulWidget {
  const OnboadingScreen({super.key});

  @override
  State<OnboadingScreen> createState() => _OnboadingScreenState();
}

class _OnboadingScreenState extends State<OnboadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final tokenStorage = TokenStorage();
    final token = await tokenStorage.getToken();

    if (token != null && token.isNotEmpty) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    }
  }

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
            left: 180,
            child: Container(child: Image.asset('assets/logo/logo_app.png')),
          ),
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                // Navigator.pushNamed(context, AppRoute.login);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Get Start',
                    style: AppTextStyle.heading2.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
