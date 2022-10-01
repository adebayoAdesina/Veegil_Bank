import 'package:flutter/material.dart';
import 'package:simple_banking/model/transfer.dart';
import '../model/account_type.dart';
import '../model/user.dart';
import '../provider/sign_user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../auths/auth.dart';

class AppData with ChangeNotifier {
  String currentUserPhoneNumber = '';
  String id = '';
  String bankId = '';
  String transferId = '';
  String withdrawId = '';
  bool _isLoad = false;
  // User _user = User();

  User _user = User(
    number: '',
    password: '',
    accounts: [
      AccountType(
        accountBalance: 0,
        accountTitle: 'Bonuses',
      ),
      AccountType(
        accountBalance: 0,
        accountTitle: 'Salary',
      ),
      AccountType(
        accountBalance: 0,
        accountTitle: 'Savings account',
      ),
      AccountType(
        accountBalance: 0,
        accountTitle: 'Fixed account',
      ),
    ],
    sents: [],
    received: [],
  );

  User get user {
    return _user;
  }

  bool get isLoading {
    return _isLoad;
  }

  double getBalance() {
    double total = 0;
    List accBalance = _user.accounts!.map((e) => e.accountBalance).toList();
    double balance = accBalance.fold(
      total,
      (previousValue, element) => total += element,
    );
    return total;
  }

  Future<String> getUser(SignUser sign) async {
    String res = 'Please check your internet connection';

    //URL + Request structures
    // GET /auth/login/phoneNumber
    String getIfLoggedInUrl =
        '$FLUTTER_APP_FIREBASE_URL/auth/login/${sign.phoneNumber}.json';
    try {
      var response = await http.get(Uri.parse(getIfLoggedInUrl));
      Map<String, dynamic> data = jsonDecode(response.body);
      var getKey = data.keys.first;
      if (getKey.isNotEmpty) {
        var details = data[getKey];
        id = details['id'];
        bankId = details['bankId'];
        withdrawId = details['withdrawId'];
        transferId = details['transferId'];
        currentUserPhoneNumber = sign.phoneNumber.toString();

        // GET / account/bank
        String getUserUrl =
            '$FLUTTER_APP_FIREBASE_URL/users/$id/account/$bankId.json';
        // GET / account/withdraw
        String getUserWithdrawUrl =
            '$FLUTTER_APP_FIREBASE_URL/users/$id/withdraw/$withdrawId.json';
        // GET / account/transfer
        String getUserTransferUrl =
            '$FLUTTER_APP_FIREBASE_URL/users/$id/transfer/$transferId.json';

        try {
          var getUserResponse = await http.get(Uri.parse(getUserUrl));
          var getUserDetail = jsonDecode(getUserResponse.body);
          var getUserWithdrawResponse =
              await http.get(Uri.parse(getUserWithdrawUrl));
          var getUserWithdrawDetail = jsonDecode(getUserWithdrawResponse.body);
          var getUserTransferResponse =
              await http.get(Uri.parse(getUserTransferUrl));
          Map<String, dynamic> getUserTransferDetail =
              jsonDecode(getUserTransferResponse.body);
          List<Transfer> transactionList = [];
          List<AccountType> getUserDetailList = [];
          for (var element in getUserTransferDetail.keys) {
            var getsTransfers = getUserTransferDetail[element];
            transactionList.add(Transfer(
              amount: getsTransfers['amount'],
              description: getsTransfers['description'],
              isSent: getsTransfers['isSent'],
              phoneNumber: getsTransfers['phoneNumber'],
            ));
            // transactionList.add(getsTransfers);
          }
          for (var element in getUserDetail['accounts']) {
            var getsTransfers = element;
            getUserDetailList.add(AccountType(
              accountBalance: (getsTransfers['accountBalance'] as double),
              accountTitle: getsTransfers['accountTitle'],
            ));
            // ));
            // getUserDetailList.add(getsTransfers);
          }
          print(getUserDetailList);
          print(transactionList);
// print(getUser)
          _user = User(
            number: getUserDetail['number'],
            password: getUserDetail['password'],
            accounts: (getUserDetail['accounts']) != null
                ? getUserDetailList
                : [],
            // sents: (getUserWithdrawDetail != null)
            //     ? (getUserWithdrawDetail)
            //         .map(
            //           (e) => Transfer(
            //             amount: e['amount'],
            //             description: e['description'],
            //             phoneNumber: e['phoneNumber'],
            //           ),
            //         )
            //         .toList()
            //     : [],
            received: transactionList != null ? transactionList : []
                
          );
          _isLoad = true;

          res = 'success';
          notifyListeners();
        } catch (e) {
          res = e.toString();
        }
      } else {
        res = 'User not found';
      }
    } catch (e) {
      if (e.toString().contains('Failed host lookup')) {
        res = 'Please check your internet connection';
      } else if (e.toString().contains('Receiver: null')) {
        res = 'User not found';
      }
      notifyListeners();
    }

    return res;
  }
}
