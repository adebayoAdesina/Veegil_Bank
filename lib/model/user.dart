import 'package:simple_banking/model/account_type.dart';
import 'package:simple_banking/model/transfer.dart';

class User {
  String? number;
  String? password;
  List<AccountType>? accounts;
  List<Transfer>? sents;
  List<Transfer>? received;
  // Transfer? transfer;

  User({
    this.number,
    this.password,
    this.accounts,
    this.sents,
    this.received,
    // this.transfer,
  });
}
