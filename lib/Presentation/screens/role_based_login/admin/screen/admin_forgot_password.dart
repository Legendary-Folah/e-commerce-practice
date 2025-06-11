import 'package:e_commerce_app/Presentation/screens/login_screen.dart';
import 'package:e_commerce_app/core/helper_funcs.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class AdminForgotPassword extends StatefulWidget {
  const AdminForgotPassword({super.key});

  @override
  State<AdminForgotPassword> createState() => _AdminForgotPasswordState();
}

class _AdminForgotPasswordState extends State<AdminForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 30, vertical: 5),
          child: Center(
            child: Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot Password? Please input ypur email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                CustomTextField(
                  controller: _emailController,
                  labelText: 'Input email',
                ),
                CustomButton(
                  height: 50,
                  width: 200,
                  text: 'Reset Password!',
                  onPressed: () {
                    _authService.resetPassword(_emailController.text.trim());
                    context.showSuccessSnackBar(
                      message:
                          'Password reset link sent to ${_emailController.text.trim()}',
                    );
                    Future.delayed(Duration(milliseconds: 3000), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return LoginScreen();
                          },
                        ),
                      );
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
