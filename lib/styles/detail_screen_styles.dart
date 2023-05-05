import 'package:ecommerceapp/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class DetailScreenStyles {
  static const TextStyle companytitleStyle = TextStyle(
    color: AppColors.baseBlackColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle productModelStyle = TextStyle(
    color: AppColors.baseDarkPinkColor,
    // fontSize: 18,
    // fontWeight: FontWeight.w600,
  );
  static const TextStyle productPriceStyle = TextStyle(
    color: AppColors.baseBlackColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle productOldPriceStyle = TextStyle(
    color: AppColors.baseGrey60Color,
    fontSize: 16,
    decoration: TextDecoration.lineThrough,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle productDropDownValueStyle = TextStyle(
    color: AppColors.baseBlackColor,
    fontSize: 22,
    // decoration: TextDecoration.lineThrough,
    // fontWeight: FontWeight.w600,
  );
  static const TextStyle buttonTextStyle = TextStyle(
    color: AppColors.baseWhiteColor,
    fontSize: 20,
  );

  static const TextStyle descriptionTextStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: AppColors.baseBlackColor,
  );

  static const TextStyle sizeGuideTextStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w900,
    color: AppColors.baseBlackColor,
  );

  static const TextStyle youmayalsolikeTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.baseBlackColor,
  );

  static const TextStyle showallTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.baseDarkPinkColor,
  );
}
