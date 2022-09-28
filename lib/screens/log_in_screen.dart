import 'package:flutter/material.dart';
import '../screens/sign_up_screen.dart';
import '../util/utils.dart';
import '../widgets/log_button.dart';
import '../widgets/input_text_fied.dart';
import '../widgets/switch_user.dart';

class LogInScreen extends StatefulWidget {
  static const id = 'log-in';
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final formKey = GlobalKey<FormState>();
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: uLogAppLogo(size.width * 0.43),
        
      ),
      body: Padding(
        padding: uLogPadding(size),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: [
                    InputTextField(
                      hintText: 'email',
                      onSaved: (e) {},
                      keyboard: TextInputType.emailAddress,
                      icon: Icons.email,
                    ),
                    uLogSizedBoxH(),
                    InputTextField(
                      hintText: 'password',
                      onSaved: (e) {},
                      keyboard: TextInputType.text,
                      icon: Icons.password_rounded,
                      isObscure: true,
                    ),
                    uLogSizedBoxH(),
                    LogButton(
                      size: size,
                      text: 'Log in',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            uLogSizedBoxH(),
            Text(
              'Forget Password',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
              ),
            ),
            uLogSizedBoxH(),
            uLogSizedBoxH(),
            SwitchUser(
              info: 'Don\'t have an account? ',
              switchUser: 'Sign up',
              onTap: () => Navigator.pushReplacementNamed(
                context,
                SignUpScreen.id,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
