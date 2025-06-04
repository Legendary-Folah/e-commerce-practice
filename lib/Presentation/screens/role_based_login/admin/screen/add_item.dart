import 'dart:io';

import 'package:e_commerce_app/Presentation/screens/role_based_login/admin/provider/add_items_notifier.dart';
import 'package:e_commerce_app/core/helper_funcs.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddItem extends ConsumerWidget {
  AddItem({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _sizesController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _discountPercentageController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addItemNotifier = ref.watch(addItemProvider.notifier);
    final addItemState = ref.watch(addItemProvider);
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
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: addItemState.imagePath != null
                      ? ClipRect(
                          child: Image.file(
                            File(addItemState.imagePath!),
                            fit: BoxFit.cover,
                          ),
                        )
                      : addItemState.isLoading ?? false
                      ? CircularProgressIndicator()
                      : GestureDetector(
                          onTap: () {
                            addItemNotifier.pickmage();
                          },
                          child: const Icon(
                            Icons.add_a_photo,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                ),
              ),
              CustomTextField(controller: _nameController, labelText: 'Name'),
              CustomTextField(
                controller: _priceController,
                labelText: 'Price',
                keyboardType: TextInputType.numberWithOptions(),
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                value: addItemState.selectedCategory,
                onChanged: addItemNotifier.selectCategory,
                items: addItemState.categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
              ),
              CustomTextField(
                onFieldSubmitted: (value) {
                  addItemNotifier.addSize(value);
                  _sizesController.clear();
                },
                controller: _sizesController,
                labelText: 'Sizes, (commas seperated)',
              ),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: addItemState.sizes.map((size) {
                  return Chip(
                    label: Text(size),
                    onDeleted: () => addItemNotifier.removeSize(size),
                  );
                }).toList(),
              ),
              CustomTextField(
                onFieldSubmitted: (value) {
                  addItemNotifier.addColor(value);
                  _colorController.clear();
                },
                controller: _colorController,
                labelText: 'Color, (Commas seperated)',
              ),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: addItemState.colors.map((color) {
                  return Chip(
                    label: Text(color),
                    onDeleted: () => addItemNotifier.removeColor(color),
                  );
                }).toList(),
              ),
              Row(
                spacing: 1,
                children: [
                  Checkbox(
                    value: addItemState.isDiscounted,
                    onChanged: addItemNotifier.toggleDiscount,
                  ),
                  Text('Apply Discount'),
                ],
              ),
              if (addItemState.isDiscounted)
                Column(
                  children: [
                    CustomTextField(
                      controller: _discountPercentageController,
                      labelText: 'Discount Percentage (%)',
                      onFieldSubmitted: (value) {
                        addItemNotifier.setDiscountPercentage(value);
                        // _discountPercentageController.clear();
                      },
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              addItemState.isLoading ?? false
                  ? Center(child: CircularProgressIndicator())
                  : Center(
                      child: CustomButton(
                        height: 45,
                        width: 180,
                        text: 'Add Items',
                        onPressed: () async {
                          try {
                            await addItemNotifier.saveAndUploadItem(
                              _nameController.text,
                              _priceController.text,
                            );
                            context.showSuccessSnackBar(
                              message: 'Item Added Successfully',
                            );
                            _nameController.clear();
                            _priceController.clear();
                          } catch (e) {
                            context.showErrorSnackBar(message: 'Error: $e');
                            throw Exception('Failed to add item: $e');
                          }
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
