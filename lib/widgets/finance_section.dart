import 'package:flutter/material.dart';
import '../util/utils.dart';
import 'finance_scroll_list_card.dart';

class FinanceSection extends StatelessWidget {
  final double bonus;
  const FinanceSection({Key? key, required this.bonus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'FINANCE',
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
        SizedBox(
          height: 120,
          width: double.infinity,

          child: FinanceScrollListCard(bonus: bonus),
        )
      ],
    );
  }
}

