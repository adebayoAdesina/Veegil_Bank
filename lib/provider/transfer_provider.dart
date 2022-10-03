import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_banking/model/transfer.dart';
import 'package:simple_banking/model/user.dart';
import '../auths/auth.dart';
import 'app_data.dart';

class TransferProvider with ChangeNotifier {
  Future<String> transfer(
    String id,
    String transferId,
    String phoneNumber,
    double amount,
    String description,
    String bankId,
    User user,
  ) async {
    String res = 'Failed';

    // POST to current user / account/transfer
    String postUserTransferUrl =
        '$FLUTTER_APP_FIREBASE_URL/users/$id/transfer/$transferId.json';
    Map<String, dynamic> _transfer = {
      'phoneNumber': phoneNumber,
      'amount': amount,
      'description': description,
      'isSent': true,
    };

    // Get / auth/login
    String logInUrl = '$FLUTTER_APP_FIREBASE_URL/auth/login/$phoneNumber.json';
    try {
      var getIfUserISVerified = await http.get(Uri.parse(logInUrl));
      Map<String, dynamic> getUserData = jsonDecode(getIfUserISVerified.body);
      var getKey = getUserData.keys.first;
      if (getKey.isNotEmpty) {
        var details = getUserData[getKey];
        var getUserId = details['id'];
        var getUserTransferId = details['transferId'];
        var getUserBankId = details['bankId'];

        // PATCH to user / account/bank
        String getAndUpdateUserTransferUrl =
            '$FLUTTER_APP_FIREBASE_URL/users/$id/account/$bankId.json';

        // PATCH to transferred / account/bank
        String getWhereUserTransferUrl =
            '$FLUTTER_APP_FIREBASE_URL/users/$getUserId/account/$getUserBankId.json';

        // To Post to the address transferred  to
        // POST to recieving user / account/transfer
        String postTransferUrl =
            '$FLUTTER_APP_FIREBASE_URL/users/$getUserId/transfer/$getUserTransferId.json';
        Map<String, dynamic> _posttransfer = {
          'phoneNumber': phoneNumber,
          'amount': amount,
          'description': description,
          'isSent': false,
        };
        try {
          var postToTransferLink = await http.post(
            Uri.parse(postTransferUrl),
            body: jsonEncode(_posttransfer),
          );
          var postFromTransferLink = await http.post(
            Uri.parse(postUserTransferUrl),
            body: jsonEncode(_transfer),
          );
          var _userSavingsAccount = user.accounts!.firstWhere(
              (element) => element.accountTitle == 'Savings account');
          var _userFixedAccount = user.accounts!
              .firstWhere((element) => element.accountTitle == 'Fixed account');
          var _userSalaryAccount = user.accounts!
              .firstWhere((element) => element.accountTitle == 'Salary');
          var _userBonusesAccount = user.accounts!
              .firstWhere((element) => element.accountTitle == 'Bonuses');

          // Patch request to update sent user
          var updateUserTransfer = await http.patch(
            Uri.parse(getAndUpdateUserTransferUrl),
            body: jsonEncode(
              {
                'number': user.number,
                'password': user.password,
                'accounts': [
                  {
                    'accountBalance': _userBonusesAccount.accountBalance,
                    'accountTitle': _userBonusesAccount.accountTitle,
                  },
                  {
                    'accountBalance': _userSalaryAccount.accountBalance,
                    'accountTitle': _userSalaryAccount.accountTitle,
                  },
                  {
                    'accountBalance':
                        _userSavingsAccount.accountBalance! - amount,
                    'accountTitle': _userSavingsAccount.accountTitle,
                  },
                  {
                    'accountBalance': _userFixedAccount.accountBalance,
                    'accountTitle': _userFixedAccount.accountTitle,
                  },
                ],
              },
            ),
          );

          // Patch request to update transfer user
          var getUpdateToTransferredUserTransfer = await http.get(
            Uri.parse(getWhereUserTransferUrl),
          );
          var getUpdateToTransferredUserData =
              jsonDecode(getUpdateToTransferredUserTransfer.body);

          var updateToTransferredUserTransfer = await http.patch(
            Uri.parse(getWhereUserTransferUrl),
            body: jsonEncode(
              {
                'number': getUpdateToTransferredUserData['number'],
                'password': getUpdateToTransferredUserData['password'],
                'accounts': [
                  {
                    'accountBalance': getUpdateToTransferredUserData['accounts']
                        [0]['accountBalance'],
                    'accountTitle': getUpdateToTransferredUserData['accounts']
                        [0]['accountTitle'],
                  },
                  {
                    'accountBalance': getUpdateToTransferredUserData['accounts']
                        [1]['accountBalance'],
                    'accountTitle': getUpdateToTransferredUserData['accounts']
                        [1]['accountTitle'],
                  },
                  {
                    'accountBalance': getUpdateToTransferredUserData['accounts']
                            [2]['accountBalance'] +
                        amount,
                    'accountTitle': getUpdateToTransferredUserData['accounts']
                        [2]['accountTitle'],
                  },
                  {
                    'accountBalance': getUpdateToTransferredUserData['accounts']
                        [3]['accountBalance'],
                    'accountTitle': getUpdateToTransferredUserData['accounts']
                        [3]['accountTitle'],
                  },
                ],
              },
            ),
          );
          res = 'success';
        } catch (e) {}
      }
    } catch (e) {}

    return res;
  }
}
