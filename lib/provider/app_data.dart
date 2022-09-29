import 'package:flutter/material.dart';
import '../model/account_type.dart';
import '../model/user.dart';
import '../provider/sign_user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../auths/auth.dart';

class AppData with ChangeNotifier {
  String id = '';
  String bankId = '';
  bool _isLoad = false;
  // User _user = User();

  User _user = User(
    accounts: [
      AccountType(
        accountBalance: 1000,
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
    password: 'james',
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
    String res = 'User not found';

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

        // GET / account/bank
        String getUserUrl =
            '$FLUTTER_APP_FIREBASE_URL/users/$id/account/$bankId.json';

        try {
          var getUserResponse = await http.get(Uri.parse(getUserUrl));
          var getUserDetail = jsonDecode(getUserResponse.body);
          print(getUserDetail);
          _user = User(
            number: getUserDetail['number'],
            password: getUserDetail['password'],
            accounts: (getUserDetail['accounts'] as List<dynamic>)
                .map((e) => AccountType(
                      accountBalance: (e['accountBalance'] as double),
                      accountTitle: e['accountTitle'],
                    ))
                .toList(),
          );
          _isLoad = true;
          print(_user.accounts);
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
      } else {
        res = e.toString();
      }
    }

    return res;
  }
}
