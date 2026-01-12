import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:ecomerce_app/core/theme/text_style.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/bloc.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/event.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool ishintPassword = true;

  @override
  void dispose() {
    // TODO: implement dispose
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: AppTextStyle.heading1.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Enter email and password',
              style: AppTextStyle.heading3.copyWith(
                color: const Color.fromARGB(255, 135, 134, 134),
              ),
            ),
            //Phone
            SizedBox(height: 60),
            _buildInputPhone(
              label: 'Phone',
              hint: 'Enter phone number',
              textcontroller: _phoneController,
              Validatortext: 'Invalid phone number',
            ),
            SizedBox(height: 40),
            _buildPasswordInput(
              label: 'Password',
              hint: 'Enter password',
              textcontroller: _passController,
              validatorText: 'Password must be 6 charector',
            ),
            SizedBox(height: 34),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                return GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                        LoginEvent(
                          phone: _phoneController.text.trim(),
                          password: _passController.text.trim(),
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
                        'Login',
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
      ),
    );
  }

  Widget _buildPasswordInput({
    required String label,
    required String hint,
    required TextEditingController textcontroller,
    required String validatorText,
    TextInputType keyboardType = TextInputType.visiblePassword,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.heading3.copyWith(
            color: const Color.fromARGB(255, 135, 134, 134),
          ),
        ),
        TextFormField(
          controller: textcontroller,
          obscureText: ishintPassword,
          keyboardType: keyboardType,

          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyle.smallGrey,
            border: UnderlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  ishintPassword = !ishintPassword;
                });
              },
              icon: Icon(
                ishintPassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorText;
            }
            return null;
          },
        ),
      ],
    );
  }
}

Widget _buildInputPhone({
  required String label,
  required String hint,
  required TextEditingController textcontroller,
  required String Validatortext,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: AppTextStyle.heading3.copyWith(
          color: const Color.fromARGB(255, 135, 134, 134),
        ),
      ),

      TextFormField(
        controller: textcontroller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyle.smallGrey,
          border: UnderlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return Validatortext;
          }
          return null;
        },
      ),
    ],
  );
}
