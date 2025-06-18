import 'package:e_commerce_app/Presentation/screens/role_based_login/user/detail_product_screen.dart';
import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/core/widgets/curated_item.dart';
import 'package:e_commerce_app/core/widgets/my_custom_banner.dart';
import 'package:e_commerce_app/models/app_model.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:flutter/material.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConst.kWhite,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/meeting.png', height: 35),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.shopping_bag_outlined),
                        ),
                        Positioned(
                          right: 8,
                          top: 5,
                          child: CircleAvatar(
                            radius: 9,
                            backgroundColor: ColorsConst.kRed,
                            child: Center(
                              child: Text(
                                '3',
                                style: TextStyle(
                                  color: ColorsConst.kWhite,
                                  fontSize: 8,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              MyBanner(),
              SizedBox(height: 6),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shop By Category',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    Text('See All', style: TextStyle(color: ColorsConst.kGrey)),
                  ],
                ),
              ),
              SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      categoryModel.length,
                      (index) => InkWell(
                        child: Column(
                          spacing: 8,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: ColorsConst().bannerColor,
                                backgroundImage: AssetImage(
                                  categoryModel[index].image,
                                ),
                              ),
                            ),
                            Text(categoryModel[index].name),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Curated For You',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    Text('See All', style: TextStyle(color: ColorsConst.kGrey)),
                  ],
                ),
              ),
              SizedBox(height: 6),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(appModel.length, (index) {
                      final item = appModel[index];
                      return Padding(
                        padding: index == 0
                            ? EdgeInsetsGeometry.symmetric(horizontal: 20)
                            : EdgeInsetsGeometry.only(right: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  return DetailProductScreen(appModel: item);
                                },
                              ),
                            );
                          },
                          child: CuratedItems(appModelItems: item, size: size),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
