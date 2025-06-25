import 'dart:math';

import 'package:e_commerce_app/core/colors.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void showSuccessSnackBar({required String message, VoidCallback? onDismiss}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ColorsConst.kGreen,
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: ColorsConst.kWhite,
          onPressed: () {
            if (onDismiss != null) {
              onDismiss();
            }
            ScaffoldMessenger.of(this).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  void showErrorSnackBar({required String message, VoidCallback? onDismiss}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ColorsConst.kRed,
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: ColorsConst.kWhite,
          onPressed: () {
            if (onDismiss != null) {
              onDismiss();
            }
            ScaffoldMessenger.of(this).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}

// extension to override manual sizedbox everytime.
extension WidgetSizedBoxFromNumExtension on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

String description1 = "Elevate your casual wardrobe with your";
String description2 =
    ".Crafted from premium cotton for maximum comfort, "
    "this relaxed-tee fit features";

String randomRating = '${Random().nextInt(2) + 3}.${Random().nextInt(5) + 4}';
String randomReview = '${Random().nextInt(300) + 100}';
