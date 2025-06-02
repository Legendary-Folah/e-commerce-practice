import 'package:e_commerce_app/core/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String labelText;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: ColorsConst.kGrey, width: 0.5),
        ),
      ),
    );
  }
}
