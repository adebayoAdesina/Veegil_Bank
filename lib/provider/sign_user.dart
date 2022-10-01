// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../auths/auth.dart';

class SignUser with ChangeNotifier {
  String? phoneNumber;
  String? password;

  SignUser({
    this.phoneNumber,
    this.password,
  });

  Future<String> signUp(SignUser sign) async {
    String res = 'failed';

    //URL + Request structures
    // Post / auth/signup
    String signUpUrl =
        '$FLUTTER_APP_FIREBASE_URL/auth/signup/${sign.phoneNumber}.json';

    // Post / auth/login
    String logInUrl =
        '$FLUTTER_APP_FIREBASE_URL/auth/login/${sign.phoneNumber}.json';

    try {
      var checker = await http.get(Uri.parse(logInUrl));
      var data = json.decode(checker.body);
      print(data);
      if (data == null) {
        try {
          final response = await http.post(
            Uri.parse(signUpUrl),
            body: json.encode(
              {
                'phoneNumber': sign.phoneNumber,
                'password': sign.password,
              },
            ),
          );
          Map<dynamic, dynamic> value = jsonDecode(response.body);

          // Post / accounts
          String bankUrl =
              '$FLUTTER_APP_FIREBASE_URL/users/${value['name']}/account.json';
          Map<String, dynamic> _user = {
            'number': sign.phoneNumber,
            'password': sign.password,
            'accounts': [
              {
                'accountBalance': 0.0,
                'accountTitle': 'Bonuses',
              },
              {
                'accountBalance': 0.0,
                'accountTitle': 'Salary',
              },
              {
                'accountBalance': 2000.0,
                'accountTitle': 'Savings account',
              },
              {
                'accountBalance': 0.0,
                'accountTitle': 'Fixed account',
              },
            ],
          };
          final userResponse = await http.post(
            Uri.parse(bankUrl),
            body: json.encode(
              _user,
            ),
          );

          // Post / accounts/transfer
          String transferUrl =
              '$FLUTTER_APP_FIREBASE_URL/users/${value['name']}/transfer.json';
          List<Map<String, dynamic>> _transfer = [
            {
              'phoneNumber': '',
              'amount': 0.0,
              'description': '',
              'isSent' : false,
            },
          ];
          final transferResponse = await http.post(
            Uri.parse(transferUrl),
            body: jsonEncode(_transfer),
          );
          final transferValue = jsonDecode(transferResponse.body);

          // Post / accounts/withdraw
          String withdrawUrl =
              '$FLUTTER_APP_FIREBASE_URL/users/${value['name']}/withdraw.json';
          List<Map<String, dynamic>> _withdraw = [
            {
              'phoneNumber': '',
              'amount': 0.0,
              'description': '',
              'isSent' : false,
            }
          ];
          final withdrawResponse = await http.post(
            Uri.parse(withdrawUrl),
            body: jsonEncode(_withdraw),
          );
          final withdrawValue = jsonDecode(withdrawResponse.body);

          // Post / auth / login
          Map<dynamic, dynamic> bankValue = jsonDecode(userResponse.body);
          final logInResponse = await http.post(
            Uri.parse(logInUrl),
            body: json.encode(
              {
                'phoneNumber': sign.phoneNumber,
                'password': sign.password,
                'id': value['name'],
                'bankId': bankValue['name'],
                'transferId': transferValue['name'],
                'withdrawId': withdrawValue['name'],
              },
            ),
          );
          res = 'success';
          print(value["name"]);
          notifyListeners();
        } catch (e) {
          print(e.toString());
        }
      } else {
        res = 'Phone number Already exist';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}


//  07035554425
//  08140615129