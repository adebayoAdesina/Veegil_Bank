import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'account_scroll_card.dart';

class AccountScrollListCard extends StatelessWidget {
  final List userAccount;
  const AccountScrollListCard({Key? key, required this.userAccount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: userAccount.length,
      itemBuilder: ((context, index) {
        final account = userAccount[index];
        if (index == 0) {
          return const SizedBox.shrink();
        }
        return AccountScrollCard(
          color: AppColor().kCardColor[index],
          accountType: account.accountTitle.toString(),
          amount: account.accountBalance as double,
        );
      }),
    );
  }
}
