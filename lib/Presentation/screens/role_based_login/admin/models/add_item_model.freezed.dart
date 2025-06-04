// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddItemModel {

 String? get imagePath; bool? get isLoading; String? get selectedCategory; List<String> get categories; List<String> get sizes; List<String> get colors; bool? get isDiscounted; String? get discountPercentage;
/// Create a copy of AddItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddItemModelCopyWith<AddItemModel> get copyWith => _$AddItemModelCopyWithImpl<AddItemModel>(this as AddItemModel, _$identity);

  /// Serializes this AddItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddItemModel&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.sizes, sizes)&&const DeepCollectionEquality().equals(other.colors, colors)&&(identical(other.isDiscounted, isDiscounted) || other.isDiscounted == isDiscounted)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imagePath,isLoading,selectedCategory,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(sizes),const DeepCollectionEquality().hash(colors),isDiscounted,discountPercentage);

@override
String toString() {
  return 'AddItemModel(imagePath: $imagePath, isLoading: $isLoading, selectedCategory: $selectedCategory, categories: $categories, sizes: $sizes, colors: $colors, isDiscounted: $isDiscounted, discountPercentage: $discountPercentage)';
}


}

/// @nodoc
abstract mixin class $AddItemModelCopyWith<$Res>  {
  factory $AddItemModelCopyWith(AddItemModel value, $Res Function(AddItemModel) _then) = _$AddItemModelCopyWithImpl;
@useResult
$Res call({
 String? imagePath, bool? isLoading, String? selectedCategory, List<String> categories, List<String> sizes, List<String> colors, bool? isDiscounted, String? discountPercentage
});




}
/// @nodoc
class _$AddItemModelCopyWithImpl<$Res>
    implements $AddItemModelCopyWith<$Res> {
  _$AddItemModelCopyWithImpl(this._self, this._then);

  final AddItemModel _self;
  final $Res Function(AddItemModel) _then;

/// Create a copy of AddItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imagePath = freezed,Object? isLoading = freezed,Object? selectedCategory = freezed,Object? categories = null,Object? sizes = null,Object? colors = null,Object? isDiscounted = freezed,Object? discountPercentage = freezed,}) {
  return _then(_self.copyWith(
imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,sizes: null == sizes ? _self.sizes : sizes // ignore: cast_nullable_to_non_nullable
as List<String>,colors: null == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as List<String>,isDiscounted: freezed == isDiscounted ? _self.isDiscounted : isDiscounted // ignore: cast_nullable_to_non_nullable
as bool?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AddItemModel implements AddItemModel {
  const _AddItemModel({this.imagePath, this.isLoading, this.selectedCategory, final  List<String> categories = const [], final  List<String> sizes = const [], final  List<String> colors = const [], this.isDiscounted, this.discountPercentage}): _categories = categories,_sizes = sizes,_colors = colors;
  factory _AddItemModel.fromJson(Map<String, dynamic> json) => _$AddItemModelFromJson(json);

@override final  String? imagePath;
@override final  bool? isLoading;
@override final  String? selectedCategory;
 final  List<String> _categories;
@override@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<String> _sizes;
@override@JsonKey() List<String> get sizes {
  if (_sizes is EqualUnmodifiableListView) return _sizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sizes);
}

 final  List<String> _colors;
@override@JsonKey() List<String> get colors {
  if (_colors is EqualUnmodifiableListView) return _colors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colors);
}

@override final  bool? isDiscounted;
@override final  String? discountPercentage;

/// Create a copy of AddItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddItemModelCopyWith<_AddItemModel> get copyWith => __$AddItemModelCopyWithImpl<_AddItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddItemModel&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._sizes, _sizes)&&const DeepCollectionEquality().equals(other._colors, _colors)&&(identical(other.isDiscounted, isDiscounted) || other.isDiscounted == isDiscounted)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imagePath,isLoading,selectedCategory,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_sizes),const DeepCollectionEquality().hash(_colors),isDiscounted,discountPercentage);

@override
String toString() {
  return 'AddItemModel(imagePath: $imagePath, isLoading: $isLoading, selectedCategory: $selectedCategory, categories: $categories, sizes: $sizes, colors: $colors, isDiscounted: $isDiscounted, discountPercentage: $discountPercentage)';
}


}

/// @nodoc
abstract mixin class _$AddItemModelCopyWith<$Res> implements $AddItemModelCopyWith<$Res> {
  factory _$AddItemModelCopyWith(_AddItemModel value, $Res Function(_AddItemModel) _then) = __$AddItemModelCopyWithImpl;
@override @useResult
$Res call({
 String? imagePath, bool? isLoading, String? selectedCategory, List<String> categories, List<String> sizes, List<String> colors, bool? isDiscounted, String? discountPercentage
});




}
/// @nodoc
class __$AddItemModelCopyWithImpl<$Res>
    implements _$AddItemModelCopyWith<$Res> {
  __$AddItemModelCopyWithImpl(this._self, this._then);

  final _AddItemModel _self;
  final $Res Function(_AddItemModel) _then;

/// Create a copy of AddItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imagePath = freezed,Object? isLoading = freezed,Object? selectedCategory = freezed,Object? categories = null,Object? sizes = null,Object? colors = null,Object? isDiscounted = freezed,Object? discountPercentage = freezed,}) {
  return _then(_AddItemModel(
imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,sizes: null == sizes ? _self._sizes : sizes // ignore: cast_nullable_to_non_nullable
as List<String>,colors: null == colors ? _self._colors : colors // ignore: cast_nullable_to_non_nullable
as List<String>,isDiscounted: freezed == isDiscounted ? _self.isDiscounted : isDiscounted // ignore: cast_nullable_to_non_nullable
as bool?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
