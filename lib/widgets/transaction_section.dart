import 'package:flutter/material.dart';
import 'package:simple_banking/constant/colors.dart';

import '../util/utils.dart';
import 'transaction_tile.dart';

class TransactionSection extends StatefulWidget {
  const TransactionSection({Key? key}) : super(key: key);

  @override
  State<TransactionSection> createState() => _TransactionSectionState();
}

class _TransactionSectionState extends State<TransactionSection> {
  int _currentState = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'My Transactions',
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
        Container(
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1.0,
              color: AppColor().kGrayThreeColor,
            ),
          ),
          child: Row(
            children: [
              transactionRow(
                context,
                'All',
                0,
              ),
              transactionRow(context, 'Credits', 1),
              transactionRow(context, 'Debits', 2),
            ],
          ),
        ),
        ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index != 0) {
              return TransactionTile();
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }

  Expanded transactionRow(BuildContext context, text, index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() {
          _currentState = index;
        }),
        child: Container(
          alignment: Alignment.center,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: index != 1
                ? (index == 0
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )
                    : const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ))
                : BorderRadius.circular(0),
            color: _currentState == index
                ? AppColor().kGrayThreeColor
                : Colors.transparent,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.75),
              fontSize: SizeConfig.subHeadingFontSize,
            ),
          ),
        ),
      ),
    );
  }
}

