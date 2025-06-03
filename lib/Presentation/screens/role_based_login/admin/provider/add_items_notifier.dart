import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Presentation/screens/role_based_login/admin/models/add_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddItemNotifier extends StateNotifier<AddItemModel> {
  AddItemNotifier() : super(AddItemModel());

  final CollectionReference items = FirebaseFirestore.instance.collection(
    'items',
  );
  final CollectionReference categories = FirebaseFirestore.instance.collection(
    'category',
  );

  // method to select image from gallery
  void pickmage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        state = state.copyWith(imagePath: pickedFile.path ?? "");
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
    state = state.copyWith(isDiscounted: isDiscounted);
  }

  void setDiscountPercentage(String? discountPercentage) {
    state = state.copyWith(discountPercentage: discountPercentage);
  }

  void setLoading(bool? isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  Future<void> fetchCategories() async {
    try {} catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }
}

final addItemProvider = StateNotifierProvider<AddItemNotifier, AddItemModel>((
  ref,
) {
  return AddItemNotifier();
});
