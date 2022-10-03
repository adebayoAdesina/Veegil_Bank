import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_data.dart';
import '../util/utils.dart';
import 'deposit_list_card.dart';
import 'notransaction.dart';

class UserWithdrawSection extends StatelessWidget {
  const UserWithdrawSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final withdraw = context.watch<AppData>().withdraw;
    return Column(
      children: [
        Row(
          children: [
            Text(
              'My Withdraw',
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
        withdraw.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: withdraw.length,
                primary: false,
                itemBuilder: (context, index) {
                  var currentWithdraw = withdraw[index];
                  return DepositListCard(
                    amount: '',
                    isDeposit: false,
                  );
                },
              )
            : const NoTransaction(text: 'No Withdraw')
      ],
    );
  }
}
