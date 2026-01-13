import 'package:ecomerce_app/core/theme/text_style.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/bloc.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/event.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/state.dart';
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

  @override
  void dispose() {
    _phoneController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc,AuthState>(
        listener: (context, state) {
          if (state is OtpSendForResetSuccess) {
            _pageController.jumpToPage(1);

          }
        },
        child: PageView(
          controller: _pageController,
          children: [
          _buildPhoneStep(),
          _buildOtpStep(),
        ]),
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
              Text('Enter your phone number',style: AppTextStyle.heading3,),
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
          SizedBox(height: 24),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return ElevatedButton(
                onPressed: () {
                  if (_phoneController.text.isNotEmpty) {
                    context.read<AuthBloc>().add(
                      ForgotPasswordEvent(phone:  _phoneController.text.trim()),
                    );
                  }
                },
                child: Text('Next'),
              );
            },
          ),
          SizedBox(height: 400,)
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
              Text('Enter your phone number',style: AppTextStyle.heading3,),
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
          SizedBox(height: 24),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return ElevatedButton(
                onPressed: () {
                  if (_otpController.text.isNotEmpty) {
                    context.read<AuthBloc>().add(
                      VerifyOtpForResetEvent(phone: _phoneController.text.trim(),otp: _otpController.text.trim()),
                    );
                  }
                },
                child: Text('Confirm'),
              );
            },
          ),
          SizedBox(height: 400,)
        ],
      ),
    );
  }
}
