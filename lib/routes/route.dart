import 'package:flutter/material.dart';
import 'package:simple_banking/screens/log_in_or_sign_up_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LogInOrSignUpScreen.id: (context)=> const LogInOrSignUpScreen()
};