import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Presentation/screens/login_screen/login_screen.dart';
import 'package:e_commerce_app/Presentation/screens/role_based_login/user/category_items.dart';
import 'package:e_commerce_app/Presentation/screens/role_based_login/user/product_detail_screen/product_detail_screen.dart';
import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/core/widgets/curated_item.dart';
import 'package:e_commerce_app/core/widgets/my_custom_banner.dart';
import 'package:e_commerce_app/models/app_model.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAppHomeScreen extends StatefulWidget {
  const UserAppHomeScreen({super.key});

  @override
  State<UserAppHomeScreen> createState() => _UserAppHomeScreenState();
}

class _UserAppHomeScreenState extends State<UserAppHomeScreen> {
  // category collection
  final CollectionReference categoriesCollection = FirebaseFirestore.instance
      .collection('category');
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                    GestureDetector(
                      onTap: () {
                        //   _auth.signOut();
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) {
                        //         return LoginScreen();
                        //       },
                        //     ),
                        //   );
                      },
                      child: Image.asset(
                        'assets/images/meeting.png',
                        height: 35,
                      ),
                    ),
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
              StreamBuilder(
                stream: categoriesCollection.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                streamSnapshot.data!.docs.length,
                                (index) => InkWell(
                                  onTap: () {
                                    // final filteredItems = appModel
                                    //     .where(
                                    //       (item) =>
                                    //           item.category.toLowerCase() ==
                                    //           categoryModel[index].name
                                    //               .toLowerCase(),
                                    //     )
                                    //     .toList();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) {
                                          return CategoryItems(
                                            category: streamSnapshot
                                                .data!
                                                .docs[index]['name'],
                                            selectedCategory: streamSnapshot
                                                .data!
                                                .docs[index]['name'],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Column(
                                    spacing: 8,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                        ),
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor:
                                              ColorsConst().bannerColor,
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
                        );
                      }
                      return CircularProgressIndicator(
                        color: ColorsConst.kPurple,
                      );
                    },
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
                                  return ProductDetailScreen(appModel: item);
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
