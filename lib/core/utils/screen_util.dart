
import 'package:flutter/material.dart';

class ScreenUtil {
  static late double _screenWidth;
  static late double _screenHeight;
  static const double baseWidth = 375.0;
  static const double baseHeight = 863.0;

  static double get screenWidth => _screenWidth;
  static double get screenHeight => _screenHeight;

  static double get scaleWidth => _screenWidth / baseWidth;
  static double get scaleHeight => _screenHeight / baseHeight;

  static double setSp(double size) => size * scaleWidth;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;
  }
}
