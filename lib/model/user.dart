import 'package:simple_banking/model/account_type.dart';
import 'package:simple_banking/model/sent_money.dart';

class User {
  int? number;
  String? password;
  List<AccountType>? accounts;
  List<SentMoney>? sents;

  User({
    this.number,
    this.password,
    this.accounts,
    this.sents,
  });
}