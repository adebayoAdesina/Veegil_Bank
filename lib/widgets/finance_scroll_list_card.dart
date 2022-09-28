import 'package:flutter/material.dart';

import 'finance_scroll_card.dart';

class FinanceScrollListCard extends StatelessWidget {
  const FinanceScrollListCard({
    Key? key,
    required this.bonus,
  }) : super(key: key);

  final double bonus;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
      if(index == 0) {
        return FinanceScrollCard(bonus: bonus);
      }
      return const FinanceScrollCard(bonus: 0);
      
    },);
  }
}
