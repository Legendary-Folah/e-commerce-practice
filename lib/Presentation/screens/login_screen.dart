import 'package:e_commerce_app/Presentation/screens/sign_up_screen.dart';
import 'package:e_commerce_app/Presentation/widgets/custom_button.dart';
import 'package:e_commerce_app/Presentation/widgets/custom_text_field.dart';
import 'package:e_commerce_app/core/colors.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/login.png', height: 350),
                CustomTextField(
                  labelText: 'Email',
                  controller: _emailController,
                ),
                CustomTextField(
                  labelText: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                ),
                CustomButton(
                  width: 130,
                  height: 45,
                  text: 'Log in',
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 5,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigate to Sign Up screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Sign up here',
                        style: TextStyle(
                          color: ColorsConst.kBlue,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
