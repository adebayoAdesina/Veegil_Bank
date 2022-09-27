import 'package:flutter/material.dart';
import 'package:simple_banking/widgets/log_button.dart';

class LogInOrSignUpScreen extends StatelessWidget {
  static const id = '/';
  const LogInOrSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogButton(
              size: size,
              text: 'Log in',
              onTap: () {},
            ),
            const SizedBox(height: 25),
            LogButton(
              size: size,
              text: 'Become a client of the bank',
              onTap: () {},
              isMain: false,
            ),
          ],
        ),
      ),
    );
  }
}
