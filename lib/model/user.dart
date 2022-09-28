import 'package:simple_banking/model/account_type.dart';
import 'package:simple_banking/model/sent_money.dart';

class User {
  String? name;
  String? email;
  int? number;
  String? password;
  List<AccountType>? accounts;
  List<SentMoney>? sents;

  User({
    this.name,
    this.email,
    this.number,
    this.password,
    this.accounts,
    this.sents,
  });
}