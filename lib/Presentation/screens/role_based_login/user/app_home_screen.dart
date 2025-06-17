import 'package:e_commerce_app/core/colors.dart';
import 'package:flutter/material.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConst.kWhite,
        body: Column(
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
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shop By Category',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  Text('See All', style: TextStyle(color: ColorsConst.kGrey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBanner extends StatelessWidget {
  const MyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: size.width,
      color: ColorsConst().bannerColor,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Text(
                  'NEW COLLECTIONS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: -2,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '20',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 38,
                        letterSpacing: -3,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: -1.5,
                            height: 0.8,
                          ),
                        ),
                        Text(
                          'OFF',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: -1.5,
                            height: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                MaterialButton(
                  color: ColorsConst.kBlack,
                  onPressed: () {},
                  child: Text(
                    'SHOP NOW',
                    style: TextStyle(color: ColorsConst.kWhite),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/images/democracy.png',
                height: size.height * 0.19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
