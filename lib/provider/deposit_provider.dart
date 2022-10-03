import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../auths/auth.dart';

class DepositProvider with ChangeNotifier {
  String? phoneNumber;
  double? amount;
  bool? isDeposit;

  DepositProvider({
    this.phoneNumber,
    this.amount,
    this.isDeposit,
  });

  Future<String> depositToSelfAccount(String id, String bankId, double amount,
      String phoneNumber, String depositId) async {
    String res = 'failed';

    // Get / accounts
    String bankUrl =
        '$FLUTTER_APP_FIREBASE_URL/users/$id/account/$bankId/accounts.json';

    // PATCH to user / account/bank
    String getAndUpdateUserDepositUrl =
        '$FLUTTER_APP_FIREBASE_URL/users/$id/account/$bankId.json';
    try {
      var response = await http.get(Uri.parse(bankUrl));
      var data = jsonDecode(response.body);
      var bankResponse = await http.get(Uri.parse(getAndUpdateUserDepositUrl));
      var bankData = jsonDecode(bankResponse.body);
      List newTransaction = [];
      for (var item in data) {
        if (item['accountTitle'] != 'Savings account') {
          newTransaction.add(item);
        } else {
          newTransaction.add({
            'accountBalance': item['accountBalance'] + amount,
            'accountTitle': item['accountTitle'],
          });
        }
      }

      // POST to current user / account/deposit
      String postDepositUrl =
          '$FLUTTER_APP_FIREBASE_URL/users/$id/deposit/$depositId.json';
      Map<String, dynamic> _postCredit = {
        'phoneNumber': phoneNumber,
        'amount': amount,
        'isDeposit': true,
      };

      try {
        // Patch request to update sent user
        var updateUserDeposit = await http.patch(
          Uri.parse(getAndUpdateUserDepositUrl),
          body: jsonEncode(
            {
              'number': bankData['number'],
              'password': bankData['password'],
              'accounts': newTransaction,
            },
          ),
        );
        var postFromTransferLink = await http.post(
          Uri.parse(postDepositUrl),
          body: jsonEncode(_postCredit),
        );
        res = 'success';
      } catch (e) {
        res = e.toString();
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
