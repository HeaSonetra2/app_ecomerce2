import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:ecomerce_app/core/theme/text_style.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/bloc.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/event.dart';
import 'package:ecomerce_app/feature/auth/presentation/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _phoneController = TextEditingController();
    final _passController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 100),

            //Phone
            SizedBox(height: 60),
            _buildFieldInput('Phone', 'phone are require', _phoneController),
            SizedBox(height: 40),
            //pass
            _buildFieldInput(
              'Password',
              'Password must be 6 ',
              _passController,
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
                    child: Center(child: Text('Login',style: AppTextStyle.heading2.copyWith(color: Colors.white),))
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildFieldInput(
  String hintText,
  String returnText,
  TextEditingController textEditController,
) {
  return Container(
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(width: 1, color: AppColors.secondary),
    ),
    padding: EdgeInsets.only(left: 20, top: 6),
    child: TextFormField(
      controller: textEditController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(hintText: hintText, border: InputBorder.none),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return returnText;
        } else {
          return null;
        }
      },
    ),
  );
}
