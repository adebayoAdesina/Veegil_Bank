import 'package:flutter/material.dart';
import 'package:simple_banking/screens/log_in_screen.dart';
import 'package:simple_banking/screens/sign_up_screen.dart';
import '../util/utils.dart';
import '../widgets/log_button.dart';

class LogInOrSignUpScreen extends StatelessWidget {
  static const id = 'select';
  const LogInOrSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: uLogPadding(size),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                uLogAppLogo(size.width * 0.55),
                uLogSizedBoxH(),
                uLogSizedBoxH(),
                LogButton(
                  size: size,
                  text: 'Log in',
                  onTap: () => Navigator.pushNamed(context, LogInScreen.id),
                ),
                uLogSizedBoxH(),
                LogButton(
                  size: size,
                  text: 'Become a client of the bank',
                  onTap: () => Navigator.pushNamed(context, SignUpScreen.id),
                  isMain: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
