import 'package:flutter/material.dart';

// creating height and width for application with media query
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}
//getting proportionate height as per the screen size

double getHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  //812 layout height is used by designer
  return (inputHeight / 812.0) * screenHeight;
}

//getting proportionate width as per the screen size

double getWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  //375 layout width is used by designer
  return (inputWidth / 375.0) * screenWidth;
}
