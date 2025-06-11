import 'package:e_commerce_app/core/colors.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void showSuccessSnackBar({required String message, VoidCallback? onDismiss}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ColorsConst.kGreen,
        action: SnackBarAction(
          label: 'X',
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
