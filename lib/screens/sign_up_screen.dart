import 'package:flutter/material.dart';
import 'package:simple_banking/util/utils.dart';

import '../widgets/input_text_fied.dart';
import '../widgets/log_button.dart';
import '../widgets/switch_user.dart';
import 'log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const id = 'sign-up'; 
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: uLogAppLogo(size.width * 0.43),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
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
                            hintText: 'name',
                            onSaved: (e) {},
                            keyboard: TextInputType.emailAddress,
                            icon: Icons.person,
                          ),
                          uLogSizedBoxH(),
                          InputTextField(
                            hintText: 'email',
                            onSaved: (e) {},
                            keyboard: TextInputType.emailAddress,
                            icon: Icons.email,
                          ),
                          uLogSizedBoxH(),
                          InputTextField(
                            hintText: 'phone number',
                            onSaved: (e) {},
                            keyboard: TextInputType.number,
                            icon: Icons.phone
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
                          InputTextField(
                            hintText: 'confirm password',
                            onSaved: (e) {},
                            keyboard: TextInputType.text,
                            icon: Icons.password_rounded,
                            isObscure: true,
                          ),
                          uLogSizedBoxH(),
                          LogButton(
                            size: size,
                            text: 'Sign Up',
                            onTap: () {},
                          ),
                        ],
                      ),
                      
                    ),),
                    uLogSizedBoxH(),
                uLogSizedBoxH(),
                SwitchUser(
                  info: 'Alread have an account? ',
                  switchUser: 'Log in',
                  onTap: () => Navigator.pushReplacementNamed(
                    context,
                    LogInScreen.id,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
