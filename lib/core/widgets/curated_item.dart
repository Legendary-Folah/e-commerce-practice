import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/models/app_model.dart';
import 'package:flutter/material.dart';

class CuratedItems extends StatelessWidget {
  const CuratedItems({
    super.key,
    required this.appModelItems,
    required this.size,
  });
  final AppModel appModelItems;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorsConst().bannerColor,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(appModelItems.image),
            ),
          ),
          height: size.height * 0.25,
          width: size.width * 0.5,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: ColorsConst.kWhite,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              'H&M',
              style: TextStyle(
                color: ColorsConst.kOrange,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 5),
            Text(appModelItems.rating.toString(), style: TextStyle()),
            Text(
              '${appModelItems.review}',
              style: TextStyle(color: ColorsConst().lightBlack),
            ),
          ],
        ),
      ],
    );
  }
}
