import 'dart:ui';

import 'package:e_commerce_app/core/colors.dart';

Color getColorFromName(String colorName) {
  switch (colorName) {
    case 'red':
      return ColorsConst.kRed;
    case 'white':
      return ColorsConst.kWhite;
    case 'black':
      return ColorsConst.kBlack;
    case 'purple':
      return ColorsConst.kPurple;
    case 'grey':
      return ColorsConst.kGrey;
    case 'blue':
      return ColorsConst.kBlue;
    case 'green':
      return ColorsConst.kGreen;
    case 'yellow':
      return ColorsConst.kYellow;
    case 'orange':
      return ColorsConst.kOrange;
    case 'pink':
      return ColorsConst.kPink;
    default:
      return ColorsConst.kWhite;
  }
}
