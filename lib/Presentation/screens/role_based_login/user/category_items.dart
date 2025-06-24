import 'package:e_commerce_app/Presentation/screens/role_based_login/user/detail_product_screen.dart';
import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/core/helper_funcs.dart';
import 'package:e_commerce_app/models/app_model.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/models/sub_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
    required this.category,
    required this.categoryItems,
  });

  final String category;
  final List<AppModel> categoryItems;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        hintText: "$category's fashion...",
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
            SingleChildScrollView(
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
            8.height,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: categoryItems.isEmpty
                    ? Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/sub_images/emptylist.svg',
                            width: 120,
                            height: 80,
                          ),
                          Text(
                            'No Items available in this $category category',
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorsConst.kRed,
                            ),
                          ),
                        ],
                      )
                    : GridView.builder(
                        itemCount: categoryItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          final item = categoryItems[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailProductScreen(appModel: item);
                                  },
                                ),
                              );
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: item.image,
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: ColorsConst().bannerColor,
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(item.image),
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
                                      Text(
                                        item.rating.toString(),
                                        style: TextStyle(),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${item.review}',
                                        style: TextStyle(
                                          color: ColorsConst().lightBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.5,
                                    child: Text(
                                      item.name,
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
                                        '\$${item.price.toString()}.00',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: ColorsConst.kPink,
                                          fontSize: 18,
                                          height: 1.5,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      if (item.isCheck == true)
                                        Text(
                                          '\$${item.price + 250}.00',
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
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
