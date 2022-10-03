import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/utils.dart';

class DepositListCard extends StatelessWidget {
  final String amount;
  final bool isDeposit;
  const DepositListCard(
      {Key? key, required this.amount, required this.isDeposit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isDeposit == true
          ? const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.download_rounded,
                size: 30,
              ),
            )
          : const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.upload_rounded,
                size: 30,
              ),
            ),
      title: Text(
        isDeposit == true ? 'Deposit' : 'Withdraw',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.70),
          fontSize: SizeConfig.subHeadingFontSize,
        ),
      ),
      trailing: Text(
        isDeposit == true ? '+₦$amount' : '-₦$amount',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
          fontSize: SizeConfig.subHeadingFontSize,
        ),
      ),
    );
  }
}
