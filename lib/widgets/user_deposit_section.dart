import 'package:flutter/material.dart';
import 'package:simple_banking/widgets/deposit_list_card.dart';

import '../util/utils.dart';

class UserDepositSection extends StatelessWidget {
  const UserDepositSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          primary: false,
          itemBuilder: (context, index) {
            return DepositListCard(amount: '200', isDeposit: true);
          },
        )
      ],
    );
  }
}
