import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class O2OPadding {
  static const double smallPadding = 8.0;
  static const double mediumPadding = 16.0;
  static const double largePadding = 24.0;
  static const double screenLeftPadding = 30.0;
  static const double screenTopPadding = 23.0;

  static const EdgeInsets allSmall = EdgeInsets.all(smallPadding);
  static const EdgeInsets allMedium = EdgeInsets.all(mediumPadding);
  static const EdgeInsets allLarge = EdgeInsets.all(largePadding);

  static const EdgeInsets horizontalSmall = EdgeInsets.symmetric(horizontal: smallPadding);
  static const EdgeInsets horizontalMedium = EdgeInsets.symmetric(horizontal: mediumPadding);
  static const  EdgeInsets horizontalLarge = EdgeInsets.symmetric(horizontal: largePadding);

  static const EdgeInsets verticalSmall = EdgeInsets.symmetric(vertical: smallPadding);
  static const EdgeInsets verticalMedium = EdgeInsets.symmetric(vertical: mediumPadding);
  static const EdgeInsets verticalLarge = EdgeInsets.symmetric(vertical: largePadding);

  static const EdgeInsets screenLeft = EdgeInsets.only(left: screenLeftPadding);
}