import 'package:flutter/material.dart';
import 'dart:math';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;
  static double designWidth = 375.0;
  static double designHeight = 667.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    screenWidth = min(screenWidth!, screenHeight! * 10 / 16);
    if (screenWidth! > screenHeight! * 10 / 16) {
      screenWidth = screenHeight! * 10 / 16;
    }
    orientation = _mediaQueryData.orientation;
  }

  double getHeight(double inputHeight) {
    double screenHeight = SizeConfig.screenHeight!;
    return (inputHeight / designHeight) * screenHeight;
  }

  double getWidth(double inputWidth) {
    double screenWidth = SizeConfig.screenWidth!;
    return (inputWidth / designWidth) * screenWidth;
  }
}
