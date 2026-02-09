import 'package:ecomerce_app/feature/auth/presentation/bloc/bloc.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/event.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _pageController = PageController();
  final _phonecontroller = TextEditingController();
  final _otpcontroller = TextEditingController();
  final _passcontroller = TextEditingController();
  final _namecontroller = TextEditingController();
  final _dobcontroller = TextEditingController();
  final _confirmcontroller = TextEditingController();
  final _gendercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is OtpSentSuccess) {
              _pageController.jumpToPage(1);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('OTP: ${state.otp}')));
            }

            if (state is OtpVerifySuccess) _pageController.jumpToPage(2);
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Welcome: ${state.phone}')));
            }
          },
          child: PageView(
            controller: _pageController,
            children: [
              _buildPhoneStep(),
              _buildverifyOtpStep(),
              _buildPasswordAndNameStep(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneStep() {
    return Column(
      children: [
        TextField(
          controller: _phonecontroller,
          decoration: InputDecoration(labelText: 'Phone'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(
              SendOtpEvent(phone: _phonecontroller.text),
            );
          },
          child: Text('Next'),
        ),
      ],
    );
  }

  Widget _buildverifyOtpStep() {
    return Column(
      children: [
        TextField(
          controller: _otpcontroller,
          decoration: InputDecoration(labelText: 'Otp'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(
              VerifyOtpEvent(_phonecontroller.text, _otpcontroller.text),
            );
          },
          child: Text('Next'),
        ),
      ],
    );
  }

  Widget _buildPasswordAndNameStep() {
    return Column(
      children: [
        TextField(
          controller: _passcontroller,
          decoration: InputDecoration(labelText: 'password'),
        ),
        TextField(
          controller: _confirmcontroller,
          decoration: InputDecoration(labelText: 'confirm'),
        ),
        TextField(
          controller: _namecontroller,
          decoration: InputDecoration(labelText: 'Name'),
        ),
        TextField(
          controller: _gendercontroller,
          decoration: InputDecoration(labelText: 'gender'),
        ),
        TextField(
          controller: _dobcontroller,
          decoration: InputDecoration(labelText: 'dob'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(
              CompleteRegisterEvent(
                phone: _phonecontroller.text,
                otp:_otpcontroller.text,
                password: _passcontroller.text,
                confirm: _confirmcontroller.text,
                name: _namecontroller.text,
                gender: _gendercontroller.text,
                dob: _dobcontroller.text,
              ),
            );
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
