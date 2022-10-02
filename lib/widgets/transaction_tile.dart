import 'package:flutter/material.dart';

import '../util/utils.dart';

class TransactionTile extends StatelessWidget {
  final String transferTo;
  final String amount;
  final String description;
  final bool isSend;
  const TransactionTile({
    Key? key,
    required this.transferTo,
    required this.amount,
    required this.isSend, required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isSend == true
          ? const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.upload_rounded,
                size: 30,
              ),
            )
          : const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.download_rounded,
                size: 30,
              ),
            ),
      title: Text(
        isSend == true ? 'Transfer to $transferTo' : 'Received by $transferTo',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.70),
          fontSize: SizeConfig.subHeadingFontSize,
        ),
      ),
      subtitle: Text(
        'Description: $description',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.45),
          fontSize: SizeConfig.subHeadingFontSize,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: Text(
        isSend == true ? '-₦$amount' : '+₦$amount',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
          fontSize: SizeConfig.subHeadingFontSize,
        ),
      ),
    );
  }
}
