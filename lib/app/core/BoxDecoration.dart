import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class MyBoxDecoration {
  static BoxDecoration bottomLeftRightCircularRadiusDecoration(
      {Color color = AppColors.kWhite}) {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(
          15,
        ),
        bottomRight: Radius.circular(
          15,
        ),
      ),
      color: color,
    );
  }

  static BoxDecoration bottomLeftRightCircularRadiusWithBoxShadowDecoration(
      {Color color = AppColors.kWhite}) {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(
          25,
        ),
        bottomRight: Radius.circular(
          25,
        ),
      ),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 3),
          color: AppColors.kGrey.withOpacity(0.2),
          blurRadius: 8,
          spreadRadius: 0,
        )
      ],
      color: color,
    );
  }

  static BoxDecoration roundCircularRadiusWithBoxShadowDecoration(
      {Color color = AppColors.kWhite,double radius = 25.0}) {
    return BoxDecoration(
      borderRadius:  BorderRadius.all(
        Radius.circular(
          radius,
        ),
      ),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 3),
          color: AppColors.kGrey.withOpacity(0.2),
          blurRadius: 8,
          spreadRadius: 0,
        )
      ],
      color: color,
    );
  }

  static BoxDecoration roundCircularRadiusWithOutBoxShadowDecoration(
      {Color color = AppColors.kWhite,
      double radius = 10,
      Color borderColor = AppColors.kWhite}) {
    return BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(
          radius,
        ),
      ),
      border: Border.all(color: borderColor, width: 1),
      color: color,
    );
  }

  static BoxDecoration roundCircularDropDownRadiusWithBoxShadowDecoration({
    Color color = AppColors.kWhite,
  }) {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          45,
        ),
      ),
      border: Border.all(color: AppColors.greyWhite, width: 0.5),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 3),
          color: AppColors.kGrey.withOpacity(0.2),
          blurRadius: 8,
          spreadRadius: 0,
        )
      ],
      color: color,
    );
  }

  static BoxDecoration
      roundCircularDropDownRadiusWithBoxShadowDecorationwithBorderRadius(
          {Color color = AppColors.kWhite}) {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          45,
        ),
      ),
      border: Border.all(color: AppColors.greyWhite, width: 0.5),
      color: color,
    );
  }
}
