import 'package:flutter/material.dart';
import 'package:taxi_test_app/style/app_colors.dart';


abstract class AppTextStyle{
  static TextStyle headlineTextStyle = const TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
    fontSize: 17,
  );
  static TextStyle bodyLargeTextStyle = const TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w700,
    fontSize: 17,
  );
  static TextStyle bodyMediumTextStyle = const TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
    fontSize: 17,
  );
  static TextStyle bodySmallTextStyle = const TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColors.routeText
  );
  static TextStyle CheckoutButtonTextStyle = const TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w700,
    fontSize: 17,
    color: Colors.white
  );
  static TextStyle MarketplacesButtonTextStyle = const TextStyle(
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white
  );
}