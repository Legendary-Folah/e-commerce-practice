class FCategory {
  final String name;
  final String image;

  FCategory({required this.name, required this.image});

  List<FCategory> fCategory = [
    FCategory(name: 'Women', image: 'assets/images/democracy.png'),
    FCategory(name: 'Men', image: 'assets/images/meeting.png'),
    FCategory(name: 'Kids', image: 'assets/images/sub_images/brand.png'),
    FCategory(name: 'Teens', image: 'assets/images/sub_images/business.png'),
    FCategory(name: 'Baby ', image: 'assets/images/sub_images/planning.png'),
  ];
}
