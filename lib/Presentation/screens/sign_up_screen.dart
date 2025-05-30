import 'package:e_commerce_app/Presentation/screens/login_screen.dart';
import 'package:e_commerce_app/Presentation/widgets/custom_button.dart';
import 'package:e_commerce_app/Presentation/widgets/custom_text_field.dart';
import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/services/auth_service.dart';

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String selectedRole = 'User';

  void signUp() async {}

  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/signin.png', height: 270),
              CustomTextField(controller: _emailController),
              CustomTextField(controller: _passwordController),
              CustomTextField(controller: _confirmPasswordController),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Role',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: ['Admin', 'User'].map((role) {
                  return DropdownMenuItem(value: role, child: Text(role));
                }).toList(),
                onChanged: (String? newValue) {},
              ),
              SizedBox(height: 5),
              CustomButton(
                width: 130,
                height: 45,
                text: 'Sign Up',
                onPressed: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 5,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 14),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: ColorsConst.kBlue, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
