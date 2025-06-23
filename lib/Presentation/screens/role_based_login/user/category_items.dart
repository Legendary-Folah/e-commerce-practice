import 'package:e_commerce_app/models/app_model.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
    required this.category,
    required this.categoryItems,
  });

  final String category;
  final List<AppModel> categoryItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
