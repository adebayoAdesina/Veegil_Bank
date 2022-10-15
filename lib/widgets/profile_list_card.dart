import 'package:flutter/material.dart';
import '../screens/log_in_screen.dart';

import '../constant/colors.dart';
import '../util/utils.dart';

class ProfileListCard extends StatelessWidget {
  final String text;
  final bool isLogOut;
  const ProfileListCard({
    Key? key,
    required this.text,
    this.isLogOut = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLogOut == true
          ? () => Navigator.pushNamedAndRemoveUntil(
              context, LogInScreen.id, (route) => false)
          : (() => {}),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2.0,
            color: AppColor().kGrayThreeColor,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.70),
            fontSize: SizeConfig.headingFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
