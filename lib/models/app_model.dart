import 'dart:ui';

import 'package:e_commerce_app/core/colors.dart';

class AppModel {
  final String name;
  final String image;
  final String description;
  final String category;
  final double rating;
  final int review;
  final int price;
  List<Color> color;
  List<String> size;
  bool isCheck;

  AppModel({
    required this.category,
    required this.color,
    required this.description,
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    required this.review,
    required this.size,
    required this.isCheck,
  });
}

List<AppModel> appModel = [
  AppModel(
    category: "Men",
    color: [ColorsConst.kBlue, ColorsConst.kGrey],
    description: "",
    image: 'assets/images/partners.png',
    name: 'Oversized Fit Couple',
    price: 295,
    rating: 4.9,
    review: 136,
    size: ["M", "L", "XL"],
    isCheck: true,
  ),

  AppModel(
    category: "Teens",
    color: [ColorsConst.kGreen, ColorsConst.kRed],
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"
        'fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
        'voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto',
    image: 'assets/images/car.png',
    name: 'Oversized Fit Printed',
    price: 295,
    rating: 4.9,
    review: 136,
    size: ["M", "L", "XL"],
    isCheck: true,
  ),

  AppModel(
    category: "Baby",
    color: [ColorsConst.kBlue, ColorsConst.kPurple],
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"
        'fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
    image: 'assets/images/baby-clothing.png',
    name: 'Baby Fit Printed',
    price: 295,
    rating: 4.9,
    review: 136,
    size: ["M", "L", "XL"],
    isCheck: false,
  ),

  AppModel(
    category: "Women",
    color: [ColorsConst.kOrange, ColorsConst.kPurple],
    description: "",
    image: 'assets/images/t-shirt-design.png',
    name: 'Printed Shirts For Your Admiration',
    price: 455,
    rating: 3.9,
    review: 126,
    size: ["L", "XL"],
    isCheck: true,
  ),

  AppModel(
    category: "Kids",
    color: [ColorsConst.kWhite, ColorsConst.kBlack],
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"
        'fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
        'magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur',
    image: 'assets/images/tshirt.png',
    name: 'Kidssssss Shirts',
    price: 256,
    rating: 3.9,
    review: 100,
    size: ["L", "XL", "XXL"],
    isCheck: false,
  ),
];

const description1 = 'Elevate your casual wardrobe with our';
const description2 = 'Crafted from Premium cotton for maximum comfort';
