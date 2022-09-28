import 'package:flutter/material.dart';
import '../constant/colors.dart';

class LogButton extends StatelessWidget {
  final Size size;
  final String text;
  final Function onTap;
  final bool isMain;
  const LogButton({
    Key? key,
    required this.size,
    required this.text,
    required this.onTap,
    this.isMain = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => onTap()),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.07,
        decoration: BoxDecoration(
          
          color: isMain
              ? Theme.of(context).colorScheme.primary
              : AppColor().kGrayThreeColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: isMain ? Theme.of(context).colorScheme.primary: Theme.of(context).scaffoldBackgroundColor,
            width: isMain ? 0 : 1.0,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isMain ?  Theme.of(context).scaffoldBackgroundColor : Theme.of(context).colorScheme.onPrimary,
              fontSize: 21,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
