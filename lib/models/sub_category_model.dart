class SubCategoryModel {
  final String name;
  final String image;

  SubCategoryModel({required this.name, required this.image});
}

List<SubCategoryModel> subCategories = [
  SubCategoryModel(name: 'Bags', image: 'assets/images/sub_images/bags.png'),
  SubCategoryModel(
    name: 'Wallets',
    image: 'assets/images/sub_images/wallet.png',
  ),
  SubCategoryModel(
    name: 'Footwear',
    image: 'assets/images/sub_images/footwears.png',
  ),
  SubCategoryModel(
    name: 'Clothes',
    image: 'assets/images/sub_images/clothes.png',
  ),
  SubCategoryModel(name: 'Watch', image: 'assets/images/sub_images/watch.png'),
  SubCategoryModel(
    name: 'Make Up',
    image: 'assets/images/sub_images/makeup.png',
  ),
];
