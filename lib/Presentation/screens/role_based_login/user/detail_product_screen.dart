import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/models/app_model.dart';
import 'package:flutter/material.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key, required this.appModel});
  final AppModel appModel;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConst().kLightGrey,
        centerTitle: true,
        title: Text(
          'Detail Product',
          style: TextStyle(letterSpacing: 1, fontSize: 18),
        ),
        actions: [
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
                      style: TextStyle(color: ColorsConst.kWhite, fontSize: 8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: ColorsConst().bannerColor,
            height: size.height * 0.46,
            width: size.width,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      widget.appModel.image,
                      fit: BoxFit.cover,
                      height: size.height * 0.4,
                      width: size.width * 0.84,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(3, (index) {
                          return AnimatedContainer(
                            width: 7,
                            height: 7,
                            margin: EdgeInsets.only(right: 4),
                            duration: Duration(seconds: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index == currentIndex
                                  ? ColorsConst.kBlue
                                  : ColorsConst.kGrey,
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
