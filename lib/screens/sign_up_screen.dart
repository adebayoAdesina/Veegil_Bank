import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:simple_banking/provider/sign_user.dart';
import '../provider/auth_method.dart';
import '../util/utils.dart';

import '../widgets/input_text_fied.dart';
import '../widgets/log_button.dart';
import '../widgets/switch_user.dart';
import 'log_in_screen.dart';

enum SignUpInput {
  phoneNumber,
  password,
  confirmPassword,
}

class SignUpScreen extends StatefulWidget {
  static const id = 'sign-up';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String? phoneNumber;
  String? password;
  String? confirmPhoneNumber;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _submit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    var response = await context.read<SignUser>().signUp(
          SignUser(
            phoneNumber: phoneNumber,
            password: password,
          ),
        );
    if (response == 'success') {
      print(response);
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacementNamed(context, LogInScreen.id);
    } else {
      logDialog(response, context);
      setState(() {
        _isLoading = false;
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Scaffold(
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
                          uLogSizedBoxH(),
                          InputTextField(
                            hintText: 'phone number',
                            onChanged: (e) => setState(() {
                              phoneNumber = e;
                            }),
                            keyboard: TextInputType.number,
                            icon: Icons.phone,
                            userInputType: SignUpInput.phoneNumber,
                          ),
                          uLogSizedBoxH(),
                          InputTextField(
                            hintText: 'password',
                            onChanged: (e) => setState(() {
                              password = e;
                            }),
                            keyboard: TextInputType.text,
                            icon: Icons.password_rounded,
                            isObscure: true,
                            userInputType: SignUpInput.password,
                          ),
                          uLogSizedBoxH(),
                          InputTextField(
                            hintText: 'confirm password',
                            onChanged: (e) => setState(() {
                              confirmPhoneNumber = e;
                            }),
                            keyboard: TextInputType.text,
                            icon: Icons.password_rounded,
                            isObscure: true,
                            userInputType: SignUpInput.confirmPassword,
                          ),
                          uLogSizedBoxH(),
                          LogButton(
                            size: size,
                            text: 'Sign Up',
                            onTap: () => _submit(),
                          ),
                        ],
                      ),
                    ),
                  ),
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
      ),
    );
  }
}
