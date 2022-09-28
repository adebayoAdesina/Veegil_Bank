import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../util/utils.dart';

class FinanceScrollCard extends StatelessWidget {
  final double bonus;
  const FinanceScrollCard({Key? key, required this.bonus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: 140,
      height: 140,
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor().kGrayTwoColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColor().kYellowColor,
            ),
            child: const Icon(
              Icons.favorite_border,
            ),
          ),
          const Spacer(),
          Text(
            'My Bonuses',
            style: TextStyle(
              fontSize: SizeConfig.subHeadingFontSize,
              color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.6),
            ),
          ),
          bonus != 0
              ? Text(
                  '₦ ${bonus.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: SizeConfig.subHeadingFontSize,
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
