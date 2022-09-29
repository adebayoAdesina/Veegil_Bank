import 'package:flutter/material.dart';
import 'package:simple_banking/model/account_type.dart';
import 'package:simple_banking/model/user.dart';
import 'package:simple_banking/provider/sign_user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../auths/auth.dart';

class AppData with ChangeNotifier {
  final User _user = User(
    name: 'Adebayo',
    email: 'ade"gmail.com',
    number: 08140615129,
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
    String logInUrl =
        '$FLUTTER_APP_FIREBASE_URL/auth/login/${sign.phoneNumber}.json';
    try {
      var response = await http.get(Uri.parse(logInUrl));
      Map<String, dynamic> data = jsonDecode(response.body);
      var getKey = data.keys.first;
      if (getKey.isNotEmpty) {
        res = 'success';
        print(getKey);
      } 
    } catch (e) {}

    return res;
  }
}
