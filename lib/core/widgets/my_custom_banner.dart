import 'package:e_commerce_app/core/colors.dart';
import 'package:flutter/material.dart';

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
