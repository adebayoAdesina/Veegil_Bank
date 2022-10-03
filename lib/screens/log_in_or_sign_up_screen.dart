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
  static const snackBarDuration = Duration(seconds: 3);

  final snackBar = const SnackBar(
    content: Text('Press back again to leave'),
    duration: snackBarDuration,
  );

  DateTime? backButtonPressTime;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WillPopScope(
        onWillPop:()=> handleWillPop(context),
        child: Center(
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
    final now = DateTime.now();
    final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        backButtonPressTime == null ||
            now.difference(backButtonPressTime!) > snackBarDuration;

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = now;
      Scaffold.of(context).showSnackBar(snackBar);
      return false;
    }

    return true;
  }
}
