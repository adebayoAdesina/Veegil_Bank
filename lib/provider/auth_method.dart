import 'dart:convert';

import 'package:flutter/material.dart';
import '../auths/auth.dart';
import 'package:http/http.dart' as http;

class AuthMethod with ChangeNotifier {
  String _token = '';
  // DateTime? _expiryDate;
  String? _userId;

  Future<void> signUp(String email, String password) async {
    String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$FLUTTER_APP_FIREBASE_KEY';

    var response = await http.post(
      Uri.parse(url),
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(response.body);
  }
}
