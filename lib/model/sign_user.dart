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

  Future<void> signUp(SignUser sign) async {
    String res = 'failed';

    //URL + Request structures
    // Post / auth/signup
    String signUpUrl = '$FLUTTER_APP_FIREBASE_URL/auth/signup.json';

    // Post / auth/login
    String logInUrl = '$FLUTTER_APP_FIREBASE_URL/auth/login.json';
    String url = '$FLUTTER_APP_FIREBASE_URL/account/bank.json';

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
      final logInResponse = await http.post(
        Uri.parse(logInUrl),
        body: json.encode(
          {
            'phoneNumber': sign.phoneNumber,
            'password': sign.password,
            'id' : value['name'],
          },
        ),
      );
      res = 'success';
      print(value["name"]);
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }

    print(res);
  }
}
