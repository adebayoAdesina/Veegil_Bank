import 'package:flutter/material.dart';
import 'package:simple_banking/model/account_type.dart';
import 'package:simple_banking/model/user.dart';

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
      (previousValue, element) => total+= element,
    );
    return total;
  }
}
