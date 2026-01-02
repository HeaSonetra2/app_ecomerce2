import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _phoneController = TextEditingController();
    final _passController = TextEditingController();

    return Form(
      child: Column(
        children: [
          SizedBox(height: 100),
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 60),

          TextField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              labelText: 'Passwords',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
