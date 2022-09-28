import 'package:flutter/material.dart';
import 'package:simple_banking/constant/colors.dart';
import 'package:simple_banking/util/utils.dart';

class AccountScrollCard extends StatelessWidget {
  final String accountType;
  final double amount;
  const AccountScrollCard(
      {Key? key, required this.accountType, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 170,
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor().kYellowColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'VISA',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.blockSizeHorizontal! * 5,
            ),
          ),
          const Spacer(),
          Text(
            accountType,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal! * 3,
            ),
          ),
          Text(
            '₦${amount.toStringAsFixed(0)}',
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.blockSizeHorizontal! * 5,
            ),
          ),
          const Spacer(),
          Text('** 6917')
        ],
      ),
    );
  }
}
