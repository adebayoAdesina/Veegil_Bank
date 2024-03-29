import 'package:flutter/material.dart';
import '../screens/log_in_screen.dart';
import '../screens/sign_up_screen.dart';
import '../util/utils.dart';
import '../widgets/log_button.dart';

class LogInOrSignUpScreen extends StatefulWidget {
  static const id = 'select';
  const LogInOrSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LogInOrSignUpScreen> createState() => _LogInOrSignUpScreenState();
}

class _LogInOrSignUpScreenState extends State<LogInOrSignUpScreen> {
  DateTime pre_backpress = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => handleWillPop(context),
      child: Scaffold(
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
      ),
    );
  }

  Future<bool> handleWillPop(BuildContext context) async {
    final timegap = DateTime.now().difference(pre_backpress);

    final cantExit = timegap >= const Duration(seconds: 2);

    pre_backpress = DateTime.now();

    if (cantExit) {
      //show snackbar
      const snack = SnackBar(
        content: Text('Press Back button again to Exit'),
        duration: Duration(seconds: 2),
      );

      ScaffoldMessenger.of(context).showSnackBar(snack);

      return false;
    } else {
      return true;
    }
  }
}
