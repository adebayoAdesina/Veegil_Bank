import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../util/utils.dart';

class ProfileListCard extends StatelessWidget {
  const ProfileListCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2.0,
          color: AppColor().kGrayThreeColor,
        ),
      ),
      child: Text(
        'Data',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.70),
          fontSize: SizeConfig.headingFontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}