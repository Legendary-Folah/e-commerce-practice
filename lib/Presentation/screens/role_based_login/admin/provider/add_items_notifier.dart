import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Presentation/screens/role_based_login/admin/models/add_item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddItemNotifier extends StateNotifier<AddItemModel> {
  AddItemNotifier() : super(AddItemModel());

  final CollectionReference items = FirebaseFirestore.instance.collection(
    'items',
  );
  final CollectionReference categoriesCollection = FirebaseFirestore.instance
      .collection('category');

  // method to select image from gallery
  void pickmage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        state = state.copyWith(imagePath: pickedFile.path);
      }
    } catch (e) {
      throw Exception('Failed to pick image: $e');
    }
  }

  // to select category Items
  void selectCategory(String? category) {
    state = state.copyWith(selectedCategory: category);
  }

  // add size
  void addSize(String size) {
    state = state.copyWith(sizes: [...state.sizes, size]);
  }

  // remove size
  void removeSize(String size) {
    state = state.copyWith(sizes: state.sizes.where((s) => s != size).toList());
  }

  // add color
  void addColor(String color) {
    state = state.copyWith(colors: [...state.colors, color]);
  }

  // remove color
  void removeColor(String color) {
    state = state.copyWith(
      colors: state.colors.where((c) => c != color).toList(),
    );
  }

  // for discount
  void toggleDiscount(bool? isDiscounted) {
    state = state.copyWith(isDiscounted: isDiscounted!);
  }

  void setDiscountPercentage(String? discountPercentage) {
    state = state.copyWith(discountPercentage: discountPercentage);
  }

  void setLoading(bool? isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  // fetch categories
  Future<void> fetchCategories() async {
    try {
      QuerySnapshot snapshot = await categoriesCollection.get();
      List<String> categories = snapshot.docs
          .map((doc) => doc['name'] as String)
          .toList();
      state = state.copyWith(categories: categories);
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }

  // save and upload items
  Future<void> saveAndUploadItem(String name, String price) async {
    if (name.isEmpty ||
        price.isEmpty ||
        // state.imagePath == null ||
        state.selectedCategory == null ||
        state.sizes.isEmpty ||
        state.colors.isEmpty) {
      throw Exception('Please fill all fields and upload an image');
    }
    state = state.copyWith(isLoading: true);
    try {
      final fileName = DateTime.now().microsecondsSinceEpoch.toString();
      final reference = FirebaseStorage.instance.ref().child(
        'images/$fileName',
      );

      final imageFile = File(state.imagePath!);
      if (!imageFile.existsSync()) {
        throw Exception('Image file does not exist');
      }

      await reference.putFile(imageFile);
      // final imageURL = await reference.getDownloadURL();
      // final iconURL = Icon(Icons.image);

      // save the items to firebase
      final String uid = FirebaseAuth.instance.currentUser!.uid;
      await items.add({
        'name': name,
        'price': double.parse(price),
        // 'imageURL': iconURL,
        'category': state.selectedCategory,
        'sizes': state.sizes,
        'colors': state.colors,
        'isDiscounted': state.isDiscounted,
        'discountPercentage': state.isDiscounted
            ? int.tryParse(state.discountPercentage!)
            : 0,
        'uid': uid,
      });
      state = AddItemModel();
    } catch (e) {
      throw Exception('error saving items : $e');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

final addItemProvider = StateNotifierProvider<AddItemNotifier, AddItemModel>((
  ref,
) {
  return AddItemNotifier();
});
