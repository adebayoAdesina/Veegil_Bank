import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_banking/screens/transfer_screen.dart';
import 'package:simple_banking/util/utils.dart';

import '../widgets/transaction_button.dart';
import 'deposit_screen.dart';

class TransactionScreen extends StatefulWidget {
  static const id = 'transaction';
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String _transferUrl =
        'https://img.freepik.com/free-vector/vector-illustration-realistic-style-concept-mobile-payments-using-application-your-smartphone_1441-231.jpg?w=1380&t=st=1664492546~exp=1664493146~hmac=3d2918ddefe25b6c1b20a0ab6545b31437e4c3e39b87efb8e4f178f1b9447e88';
    String _depositUrl =
        'https://img.freepik.com/free-vector/illustration-character-saving-money-safe_53876-37248.jpg?w=826&t=st=1664777355~exp=1664777955~hmac=074bed0187289f98b046caefc82bd0052e5eb662a9cc6b52daec6eb7a9bf367c';
    return Scaffold(
      body: Padding(
        padding: uHorizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, TransferScreen.id),
              child: TransactionButton(
                transferUrl: _transferUrl,
                size: size,
                text: 'Transfer',
              ),
            ),
            uSafeAreaSizedBox,
            uSafeAreaSizedBox,
            uSafeAreaSizedBox,
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, DepositScreen.id),
              child: TransactionButton(
                transferUrl: _depositUrl,
                size: size,
                text: 'Deposit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
