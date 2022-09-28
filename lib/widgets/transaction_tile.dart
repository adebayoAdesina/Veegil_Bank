import 'package:flutter/material.dart';

import '../util/utils.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 20,
        backgroundColor: Colors.red,
        child: Icon(
          Icons.upload_rounded,
          size: 30,
        ),
      ),
      title: Text(
        'Transfer to 09090909090',
        style: TextStyle(
          color: Theme.of(context)
              .colorScheme
              .onPrimary
              .withOpacity(0.70),
          fontSize: SizeConfig.subHeadingFontSize,
        ),
      ),
      subtitle: Text(
        'Date:',
        style: TextStyle(
          color: Theme.of(context)
              .colorScheme
              .onPrimary
              .withOpacity(0.45),
          fontSize: SizeConfig.subHeadingFontSize,
        ),
      ),
      trailing: Text(
        '-1000',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context)
              .colorScheme
              .onPrimary
              .withOpacity(0.6),
          fontSize: SizeConfig.subHeadingFontSize,
        ),
      ),
    );
  }
}
