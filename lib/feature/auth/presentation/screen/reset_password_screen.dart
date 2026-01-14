import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:ecomerce_app/core/theme/text_style.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/bloc.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/event.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/state.dart';
import 'package:ecomerce_app/feature/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _pageController = PageController();
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  final _newPassController = TextEditingController();
  final _conPassController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is OtpSendForResetSuccess) {
            _pageController.jumpToPage(1);
          }
          if (state is OtpVerifyForResetSuccess) {
            _pageController.jumpToPage(2);
          }
          if (state is PasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Password reset successfully!"),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: PageView(
          controller: _pageController,
          children: [_buildPhoneStep(), _buildOtpStep(), _buildPasswordStep()],
        ),
      ),
    );
  }

  Widget _buildPhoneStep() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Spacer(),
          Row(
            children: [
              Text('Enter your phone number', style: AppTextStyle.heading3),
            ],
          ),
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Phone number',
              border: UnderlineInputBorder(),
            ),
          ),
          SizedBox(height: 44),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return GestureDetector(
                onTap: () {
                  if (_phoneController.text.isNotEmpty) {
                    context.read<AuthBloc>().add(
                      ForgotPasswordEvent(phone: _phoneController.text.trim()),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: AppTextStyle.heading2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 400),
        ],
      ),
    );
  }

  Widget _buildOtpStep() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Spacer(),
          Row(
            children: [
              Text('Enter OTP for verify', style: AppTextStyle.heading3),
            ],
          ),
          TextField(
            controller: _otpController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'OTP',
              border: UnderlineInputBorder(),
            ),
          ),
          SizedBox(height: 44),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return GestureDetector(
                onTap: () {
                  if (_otpController.text.isNotEmpty) {
                    context.read<AuthBloc>().add(
                      VerifyOtpForResetEvent(
                        phone: _phoneController.text.trim(),
                        otp: _otpController.text.trim(),
                      ),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Verify',
                      style: AppTextStyle.heading2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 400),
        ],
      ),
    );
  }

  Widget _buildPasswordStep() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 200),
          Text('New Password', style: AppTextStyle.heading3),
          TextField(
            controller: _newPassController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "New Password",
              border: UnderlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text('Confirm Password', style: AppTextStyle.heading3),
          TextField(
            controller: _conPassController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Confirm Password",
              border: UnderlineInputBorder(),
            ),
          ),
          SizedBox(height: 24),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return GestureDetector(
                onTap: () {
                  if (_newPassController.text.isNotEmpty &&
                      _conPassController.text.isNotEmpty) {
                    context.read<AuthBloc>().add(
                      ResetPasswordEvent(
                        phone: _phoneController.text.trim(),
                        otp: _otpController.text.trim(),
                        newPass: _newPassController.text.trim(),
                        confirmPass: _conPassController.text.trim(),
                      ),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: AppTextStyle.heading2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
