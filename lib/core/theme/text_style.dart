import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:flutter/widgets.dart';

class AppTextStyle {
 
  static TextStyle heading1 = TextStyle(
    fontSize: 24,
    color: AppColors.text_color,
    fontWeight: FontWeight.w400
  );
  static TextStyle heading2 = TextStyle(
    fontSize: 22,
    color: AppColors.text_color,
    fontWeight: FontWeight.w400
  );

  static TextStyle heading3 = TextStyle(
    fontSize: 18,
    color: AppColors.text_color,
    fontWeight: FontWeight.w400
  );

  static TextStyle title = TextStyle(
    fontSize: 18,
    color: AppColors.text_color_title,
    fontWeight: FontWeight.w400
  );

  static TextStyle smallGrey = TextStyle(
    fontSize: 14,
    color: AppColors.text_color_grey,
    fontWeight: FontWeight.w400
  );

}
