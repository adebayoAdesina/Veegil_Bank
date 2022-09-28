import 'package:flutter/material.dart';
// import 'package:simple_banking/screens/home_screen.dart';
import 'package:simple_banking/screens/log_in_or_sign_up_screen.dart';
import 'package:simple_banking/screens/log_in_screen.dart';
import 'package:simple_banking/screens/navigation_bottom_tab.dart';
import 'package:simple_banking/screens/sign_up_screen.dart';

import '../screens/splash_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.id: (context) => const SplashScreen(),
  LogInOrSignUpScreen.id: (context) => const LogInOrSignUpScreen(),
  LogInScreen.id: (context) => const LogInScreen(),
  SignUpScreen.id: (context) => const SignUpScreen(),
  // HomeScreen.id: (context) => const HomeScreen()
  NavigationBottomTab.id : (context) => const NavigationBottomTab()
};
