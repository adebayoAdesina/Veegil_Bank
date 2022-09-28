import 'package:flutter/material.dart';
import '../util/utils.dart';

class AccountScrollCard extends StatelessWidget {
  final String accountType;
  final double amount;
  final Color color;
  const AccountScrollCard({
    Key? key,
    required this.accountType,
    required this.amount,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
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
