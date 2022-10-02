import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_banking/constant/colors.dart';

import '../provider/app_data.dart';
import '../util/utils.dart';
import 'transaction_tile.dart';

class TransactionSection extends StatefulWidget {
  const TransactionSection({Key? key}) : super(key: key);

  @override
  State<TransactionSection> createState() => _TransactionSectionState();
}

class _TransactionSectionState extends State<TransactionSection> {
  int _currentState = 0;

  int getLength(context) {
    int length = 3;
    return length;
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AppData>().user;
    final datas = context.watch<AppData>();
    print(_currentState);
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
        (user.received == null || _currentState != 0)
            ? (datas.allTransfer.isNotEmpty && _currentState == 2)
                ? ListView.builder(
                    primary: false,
                    itemCount: datas.allTransfer.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var sents = datas.allTransfer[index];
                      print(sents);
                      return TransactionTile(
                        amount: sents.amount!.toStringAsFixed(0),
                        transferTo: sents.phoneNumber.toString(),
                        description: sents.description.toString(),
                        isSend: sents.isSent!,
                      );
                    },
                  )
                : (datas.allRecieved.isNotEmpty && _currentState == 1)
                    ? ListView.builder(
                        primary: false,
                        itemCount: user.received!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var recieved = datas.allRecieved[index];

                          return TransactionTile(
                            amount: recieved.amount!.toStringAsFixed(0),
                            transferTo: recieved.phoneNumber.toString(),
                            description: recieved.description.toString(),
                            isSend: recieved.isSent!,
                          );
                        },
                      )
                    : Text(
                        'No transaction',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                      )
            : (user.received!.isEmpty)
                ? Text(
                    'No transaction',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary),
                  )
                : ListView.builder(
                    primary: false,
                    itemCount: user.received!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var transfers = user.received![index];
                      return TransactionTile(
                        amount: transfers.amount!.toStringAsFixed(0),
                        transferTo: transfers.phoneNumber.toString(),
                        description: transfers.description.toString(),
                        isSend: transfers.isSent!,
                      );
                    },
                  ),
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
