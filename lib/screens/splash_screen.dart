import 'dart:async';

import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../screens/log_in_or_sign_up_screen.dart';


class SplashScreen extends StatefulWidget {
  static const id = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1), upperBound: 1);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);

    animationController.forward();
    animationController.addListener(() {
      setState(() {
   
      });
    });
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(LogInOrSignUpScreen.id);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().kGrayTwoColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 130.0, left: 90, right: 90),
          child: Image(
            image: const AssetImage('assets/logo/simpleBank.png'),
            height: animationController.value * 90,
          ),
        ),
      ),
    );
  }
}
