import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;
  static double? headingFontSize;
  static double? subHeadingFontSize;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = (screenWidth!) / 100;
    blockSizeVertical = (screenHeight!) / 100;
    headingFontSize = blockSizeHorizontal! * 4.1;
    subHeadingFontSize = blockSizeHorizontal! * 3.8;
  }
}

EdgeInsets uLogPadding(Size size) => EdgeInsets.all(size.width * 0.05);


SizedBox uLogSizedBoxH() {
  return const SizedBox(
    height: 25,
  );
}
SizedBox uContentSizedBoxH() {
  return const SizedBox(
    height: 15,
  );
}

Image uLogAppLogo(double size) {
  return Image.asset(
    'assets/logo/simpleBank.png',
    width: size,
  );
}

SizedBox uSafeAreaSizedBox = const SizedBox(
  height: 30,
);

EdgeInsets uHorizontalPadding = const EdgeInsets.symmetric(horizontal: 20);
EdgeInsets uContentPadding = const EdgeInsets.only(top: 30,left: 20);
EdgeInsets uRightContentPadding = const EdgeInsets.only(right: 20);


Future<dynamic> logDialog(String response, BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Text(response, textAlign: TextAlign.center,),
      ),
    );
  }

