import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = (screenWidth!) / 100;
    blockSizeVertical = (screenHeight!) / 100;
  }
}

EdgeInsets uLogPadding(Size size) => EdgeInsets.all(size.width * 0.05);

SizedBox uLogSizedBoxH() {
  return const SizedBox(
    height: 25,
  );
}
