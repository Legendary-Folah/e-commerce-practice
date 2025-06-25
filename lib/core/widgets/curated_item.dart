import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/colors.dart';
import 'package:flutter/material.dart';

class CuratedItems extends StatelessWidget {
  const CuratedItems({
    super.key,
    required this.appModelItems,
    required this.size,
  });
  final DocumentSnapshot<Object?> appModelItems;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: appModelItems.id,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorsConst().bannerColor,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/t-shirt-design.png'),
              ),
            ),
            height: size.height * 0.25,
            width: size.width * 0.5,
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: ColorsConst().lightBlack2,
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'H&M',
              style: TextStyle(
                color: ColorsConst.kOrange,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.star, color: ColorsConst.kAmber, size: 17),
            SizedBox(width: 5),
            Text(
              '${Random().nextInt(2) + 3}.${Random().nextInt(5) + 4}',
              style: TextStyle(),
            ),
            SizedBox(width: 5),
            Text(
              '| ${Random().nextInt(300) + 100}',
              style: TextStyle(color: ColorsConst().lightBlack),
            ),
          ],
        ),
        SizedBox(
          width: size.width * 0.5,
          child: Text(
            appModelItems['name'] ?? 'N/A',
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
              '\$${appModelItems['price'] * (1 - appModelItems['discountPercentage'] / 100)}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: ColorsConst.kPink,
                fontSize: 18,
                height: 1.5,
              ),
            ),
            SizedBox(width: 5),
            if (appModelItems['isDiscounted'] == true)
              Text(
                '\$${appModelItems['price'] + 250}.00',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: ColorsConst().lightBlack2,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: ColorsConst().lightBlack2,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
