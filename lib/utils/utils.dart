import 'package:flutter/widgets.dart';

bool isMobileDevice(BuildContext context) {
  final double deviceWidth = MediaQuery.of(context).size.width;
  const double mobileWidthBreakpoint = 600;
  return deviceWidth < mobileWidthBreakpoint;
}

double currentScreenWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

double currentScreenHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}