import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';

class O2OTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      unselectedWidgetColor: AppColors.lightGreyColor4,
      primaryColor: Colors.blue,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16.0),
        bodyMedium: TextStyle(fontSize: 14.0),
        labelLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor1),
        labelMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor1),
        labelSmall: TextStyle(
          fontSize: 16.0,
          color: Color(0xffe68012),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Colors.green, background: Colors.white),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      unselectedWidgetColor: AppColors.lightGreyColor4,
      primaryColor: Colors.purple,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.white),
        displayMedium: TextStyle(
            fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white),
        labelMedium: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
        labelSmall: TextStyle(
          fontSize: 16.0,
          color: Color(0xffe68012),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Colors.amber, background: Colors.black),
    );
  }
}
