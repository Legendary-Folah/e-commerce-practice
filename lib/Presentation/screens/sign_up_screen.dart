import 'package:e_commerce_app/Presentation/screens/login_screen.dart';
import 'package:e_commerce_app/core/form_validations.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/core/helper_funcs.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  String selectedRole = 'User';
  bool isLoading = false;
  bool isPasswordVisible = false;

  void signUp() async {
    setState(() {
      isLoading = true;
    });
    String? result = await _authService.signUp(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      role: selectedRole,
    );
    setState(() {
      isLoading = false;
    });
    if (result == null) {
      context.showSuccessSnackBar(message: 'Successfully Signed up');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return LoginScreen();
          },
        ),
      );
    } else {
      context.showErrorSnackBar(message: 'Failed to Sign up $result');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/signin.png', height: 270),
                CustomTextField(
                  labelText: 'Name',
                  controller: _nameController,
                  validator: (value) {
                    return FormValidations.validateEmailField(value);
                  },
                ),
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
                    return FormValidations.validateEmailField(value);
                  },
                ),
                DropdownButtonFormField(
                  value: selectedRole,
                  decoration: InputDecoration(
                    labelText: 'Role',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: ['Admin', 'User'].map((role) {
                    return DropdownMenuItem(value: role, child: Text(role));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRole = newValue ?? 'User';
                    });
                  },
                ),
                SizedBox(height: 5),
                isLoading
                    ? CircularProgressIndicator(color: ColorsConst.kPurple)
                    : CustomButton(
                        width: 130,
                        height: 45,
                        text: 'Sign Up',
                        onPressed: signUp,
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
                        'Log in here',
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
