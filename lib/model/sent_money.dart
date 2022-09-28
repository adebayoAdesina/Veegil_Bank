import 'package:simple_banking/model/account_type.dart';

class SentMoney {
  String? number;
  double? amount;
  DateTime? time;
  String? discription;
  AccountType? accountType;

  SentMoney({
    this.number,
    this.amount,
    this.time,
    this.discription,
    this.accountType,
  });
}