import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_item_model.freezed.dart';
part 'add_item_model.g.dart';

@freezed
abstract class AddItemModel with _$AddItemModel {
  const factory AddItemModel({
    String? imagePath,
    bool? isLoading,
    String? selectedCategory,
    @Default([]) List<String> categories,
    @Default([]) List<String> sizes,
    @Default([]) List<String> colors,
    bool? isDiscounted,
    String? discountPercentage,
  }) = _AddItemModel;

  factory AddItemModel.fromJson(Map<String, dynamic> json) =>
      _$AddItemModelFromJson(json);
}
