import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/core/helper_funcs.dart';
import 'package:e_commerce_app/models/app_model.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: ColorsConst.kWhite,
      body: SafeArea(
        child: Column(
          spacing: 10,
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
            10.width,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(filteredCategory.length, (index) {
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
          ],
        ),
      ),
    );
  }
}
