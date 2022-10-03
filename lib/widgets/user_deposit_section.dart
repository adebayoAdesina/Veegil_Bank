import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_banking/provider/app_data.dart';
import 'package:simple_banking/widgets/deposit_list_card.dart';
import 'package:simple_banking/widgets/notransaction.dart';

import '../util/utils.dart';

class UserDepositSection extends StatelessWidget {
  const UserDepositSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deposit = context.watch<AppData>().deposit;
    return Column(
      children: [
        Row(
          children: [
            Text(
              'My Deposit',
              style: TextStyle(
                fontSize: SizeConfig.headingFontSize,
                fontWeight: FontWeight.w500,
                color:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.75),
              ),
            ),
          ],
        ),
        uContentSizedBoxH(),
        deposit.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: deposit.length,
                primary: false,
                itemBuilder: (context, index) {
                  var currentDeposit = deposit[index];
                  return DepositListCard(
                    amount: currentDeposit.amount.toString(),
                    isDeposit: true,
                  );
                },
              )
            : const NoTransaction(text: 'No deposit')
      ],
    );
  }
}
