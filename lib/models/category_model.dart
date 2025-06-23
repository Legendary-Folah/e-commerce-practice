class CategoryModel {
  final String name;
  final String image;

  CategoryModel({required this.name, required this.image});
}

final List<CategoryModel> categoryModel = [
  CategoryModel(name: 'Women', image: 'assets/images/democracy.png'),
  CategoryModel(name: 'Men', image: 'assets/images/meeting.png'),
  CategoryModel(name: 'Kids', image: 'assets/images/sub_images/brand.png'),
  CategoryModel(name: 'Teens', image: 'assets/images/sub_images/business.png'),
  CategoryModel(name: 'Baby ', image: 'assets/images/sub_images/planning.png'),
];

List<String> filteredCategory = [
  'Filter',
  'Ratings',
  'Size',
  'Color',
  'Price',
  'Brand',
];
