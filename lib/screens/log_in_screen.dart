import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../provider/app_data.dart';
import '../screens/home_screen.dart';
import '../screens/navigation_bottom_tab.dart';
import '../provider/sign_user.dart';
import '../screens/sign_up_screen.dart';
import '../util/utils.dart';
import '../widgets/log_button.dart';
import '../widgets/input_text_fied.dart';
import '../widgets/switch_user.dart';

enum SignInInput {
  phoneNumber,
  password,
}

class LogInScreen extends StatefulWidget {
  static const id = 'log-in';
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final formKey = GlobalKey<FormState>();
  bool isCheck = false;
  bool _isLoading = false;

  String? phoneNumber;
  String? password;

  @override
  void initState() {
    // phoneNumber = TextEditingController();
    // password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // phoneNumber.dispose();
    // password.dispose();
    super.dispose();
  }

  void _submit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    var response = await context.read<AppData>().getUser(
          SignUser(
            phoneNumber: phoneNumber,
            password: password,
          ),
        );
    print(response);
    if (response == 'success') {
      print(response);
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacementNamed(
        context,
        NavigationBottomTab.id,
      );
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
                        userInputType: SignUpInput.phoneNumber,
                      ),
                      uLogSizedBoxH(),
                      LogButton(
                        size: size,
                        text: 'Log in',
                        onTap: () => _submit(),
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
      ),
    );
  }
}
