import 'package:flutter/material.dart';
import '../util/utils.dart';
import '../widgets/log_button.dart';

class LogInOrSignUpScreen extends StatelessWidget {
  static const id = '/';
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
                LogButton(
                  size: size,
                  text: 'Log in',
                  onTap: () {},
                ),
                uLogSizedBoxH(),
                LogButton(
                  size: size,
                  text: 'Become a client of the bank',
                  onTap: () {},
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
