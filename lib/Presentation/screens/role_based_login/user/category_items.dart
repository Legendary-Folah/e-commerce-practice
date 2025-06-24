import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/core/helper_funcs.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/models/sub_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({
    super.key,
    required this.category,
    required this.selectedCategory,
  });

  final String category;
  // final List<AppModel> categoryItems;
  final String selectedCategory;

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  TextEditingController searchController = TextEditingController();
  List<QueryDocumentSnapshot> allItems = [];
  List<QueryDocumentSnapshot> filteredItems = [];

  @override
  void initState() {
    searchController.addListener(onSearchChanged);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onSearchChanged() {
    String searchItem = searchController.text.toLowerCase();
    setState(() {
      filteredItems = allItems.where((item) {
        final data = item.data() as Map<String, dynamic>;
        final itemName = data['name'].toString().toLowerCase();
        return itemName.contains(searchItem);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final CollectionReference itemsCollection = FirebaseFirestore.instance
        .collection('items');
    return Scaffold(
      backgroundColor: ColorsConst.kWhite,
      body: SafeArea(
        child: Column(
          spacing: 6,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                spacing: 10,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: ColorsConst().kLightGrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.arrow_back_ios_new_outlined, size: 18),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        hintText: "${widget.category}'s fashion...",
                        hintStyle: TextStyle(color: ColorsConst().lightBlack2),
                        filled: true,
                        fillColor: ColorsConst().kLightGrey,
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: ColorsConst().lightBlack,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            4.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(subCategories.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: BoxBorder.all(
                              color: ColorsConst().lightBlack2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            spacing: 5,
                            children: [
                              Text(filteredCategory[index]),
                              index == 0
                                  ? Icon(Icons.filter_list, size: 15)
                                  : Icon(Icons.keyboard_arrow_down, size: 15),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            18.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(subCategories.length, (index) {
                      return InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: ColorsConst().kLightGrey,
                                backgroundImage: AssetImage(
                                  subCategories[index].image,
                                ),
                              ),
                            ),
                            10.height,
                            Text(subCategories[index].name),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            8.height,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: StreamBuilder(
                  stream: itemsCollection
                      .where('category', isEqualTo: widget.selectedCategory)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final items = snapshot.data!.docs;
                      if (allItems.isEmpty) {
                        allItems = items;
                        filteredItems = items;
                      }
                      if (filteredItems.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 20,
                            children: [
                              SvgPicture.asset(
                                'assets/images/sub_images/emptylist.svg',
                                height: 70,
                                width: 35,
                              ),
                              Text(
                                'No Items Found',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      }

                      return GridView.builder(
                        itemCount: filteredItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          final doc = filteredItems[index];
                          final item = doc.data() as Map<String, dynamic>;
                          // final itemId = doc.id;
                          return GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return ProductDetailScreen(appModel: item);
                              //     },
                              //   ),
                              // );
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: doc.id,
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: ColorsConst().bannerColor,
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            'assets/images/sub_images/watch.png',
                                          ),
                                        ),
                                      ),
                                      height: size.height * 0.25,
                                      width: size.width * 0.5,
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              ColorsConst().lightBlack2,
                                          radius: 18,
                                          child: Icon(
                                            Icons.favorite_border_outlined,
                                            color: ColorsConst.kWhite,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'H&M',
                                        style: TextStyle(
                                          color: ColorsConst.kOrange,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.star,
                                        color: ColorsConst.kAmber,
                                        size: 17,
                                      ),
                                      SizedBox(width: 3),
                                      // Text(
                                      //   item.rating.toString(),
                                      //   style: TextStyle(),
                                      // ),
                                      // SizedBox(width: 5),
                                      // Text(
                                      //   '| ${item.review}',
                                      //   style: TextStyle(
                                      //     color: ColorsConst().lightBlack,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.5,
                                    child: Text(
                                      item['category'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 1.5,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${item['price'] * (1 - item['discountPercentage'] / 100)}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: ColorsConst.kPink,
                                          fontSize: 18,
                                          height: 1.5,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      if (item['isDiscounted'] == true)
                                        Text(
                                          '\$${item['price']}.00',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: ColorsConst().lightBlack2,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor:
                                                ColorsConst().lightBlack2,
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error : $snapshot'));
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: ColorsConst.kPurple,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
