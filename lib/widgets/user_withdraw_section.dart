import 'package:flutter/material.dart';

import '../util/utils.dart';
import 'deposit_list_card.dart';

class UserWithdrawSection extends StatelessWidget {
  const UserWithdrawSection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          primary: false,
          itemBuilder: (context, index) {
            return DepositListCard(amount: '200', isDeposit: false,);
          },
        )
      ],
    );
  }
}