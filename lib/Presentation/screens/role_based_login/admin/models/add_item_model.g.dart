// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddItemModel _$AddItemModelFromJson(Map<String, dynamic> json) =>
    _AddItemModel(
      imagePath: json['imagePath'] as String?,
      isLoading: json['isLoading'] as bool?,
      selectedCategory: json['selectedCategory'] as String?,
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sizes:
          (json['sizes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      colors:
          (json['colors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isDiscounted: json['isDiscounted'] as bool? ?? false,
      discountPercentage: json['discountPercentage'] as String?,
    );

Map<String, dynamic> _$AddItemModelToJson(_AddItemModel instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'isLoading': instance.isLoading,
      'selectedCategory': instance.selectedCategory,
      'categories': instance.categories,
      'sizes': instance.sizes,
      'colors': instance.colors,
      'isDiscounted': instance.isDiscounted,
      'discountPercentage': instance.discountPercentage,
    };
