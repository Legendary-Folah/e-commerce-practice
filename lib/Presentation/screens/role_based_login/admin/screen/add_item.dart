import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _sizesController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _discountPercentageController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Items'), centerTitle: true),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 25, vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              CustomTextField(controller: _nameController, labelText: 'Name'),
              CustomTextField(controller: _priceController, labelText: 'Price'),
              CustomTextField(
                controller: _sizesController,
                labelText: 'Sizes, (commas seperated)',
              ),
              CustomTextField(
                controller: _colorController,
                labelText: 'Color, (Commas seperated)',
              ),
              CustomTextField(
                controller: _discountPercentageController,
                labelText: 'Discount Percentage (%)',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
