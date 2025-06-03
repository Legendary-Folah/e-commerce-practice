import 'package:e_commerce_app/Presentation/screens/role_based_login/admin/screen/admin_home_screen.dart';
import 'package:e_commerce_app/Presentation/screens/role_based_login/user/user_app_first_screen.dart';
import 'package:e_commerce_app/Presentation/screens/sign_up_screen.dart';
import 'package:e_commerce_app/core/form_validations.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/core/helper_funcs.dart';
import 'package:e_commerce_app/services/auth_service.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isLoading = false;
  String selectedRole = 'User';

  void logIn() async {
    setState(() {
      isLoading = true;
    });
    String? result = await _authService.logIn(
      email: _emailController.text,
      password: _passwordController.text,
      role: selectedRole,
    );
    setState(() {
      isLoading = false;
    });

    if (result == 'Admin') {
      context.showSuccessSnackBar(message: 'Successfully Logged in as Admin');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return AdminHomeScreen(); // Replace with your home screen
          },
        ),
      );
    } else if (result == 'User') {
      context.showSuccessSnackBar(message: 'Successfully Logged in');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return UserAppFirstScreen(); // Replace with your admin dashboard
          },
        ),
      );
    } else {
      context.showErrorSnackBar(message: 'Failed to Log in $result');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Form(
            key: formKey,
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
                    validator: (value) {
                      return FormValidations.validateEmailField(value);
                    },
                  ),
                  CustomTextField(
                    labelText: 'Password',
                    controller: _passwordController,
                    obscureText: isPasswordVisible ? false : true,
                    suffixIcon: IconButton(
                      icon: isPasswordVisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    validator: (value) {
                      return FormValidations.validateRequiredField(value);
                    },
                  ),
                  isLoading
                      ? CircularProgressIndicator(color: ColorsConst.kPurple)
                      : CustomButton(
                          width: 130,
                          height: 45,
                          text: 'Log in',
                          onPressed: logIn,
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
      ),
    );
  }
}
