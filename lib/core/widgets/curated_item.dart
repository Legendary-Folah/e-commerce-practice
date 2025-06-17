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
        ),
      ],
    );
  }
}
