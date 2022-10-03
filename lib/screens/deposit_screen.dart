import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:simple_banking/provider/deposit_provider.dart';
import 'package:simple_banking/screens/navigation_bottom_tab.dart';

import '../constant/colors.dart';
import '../provider/app_data.dart';
import '../util/utils.dart';
import '../widgets/log_button.dart';

class DepositScreen extends StatefulWidget {
  static const id = 'deposit';
  const DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  bool _changed = false;

  double amount = 0;

  String password = '';
  bool _isLoad = false;
  @override
  Widget build(BuildContext context) {
    final user = context.watch<AppData>();
    final deposit = context.read<DepositProvider>();
    SizeConfig().init(context);
    String _url =
        'https://img.freepik.com/free-vector/illustration-character-saving-money-safe_53876-37248.jpg?w=826&t=st=1664777355~exp=1664777955~hmac=074bed0187289f98b046caefc82bd0052e5eb662a9cc6b52daec6eb7a9bf367c';
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Deposit',
            style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal! * 5),
          ),
          centerTitle: true,
        ),
        body: ModalProgressHUD(
          inAsyncCall: _isLoad,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding: uHorizontalPadding,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        // color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Opacity(
                          opacity: 0.8,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: _url,
                            errorWidget: (context, url, error) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    uLogSizedBoxH(),
                    Form(
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          transferInput(context, 'Amount', (e) {
                            setState(() {
                              amount = double.parse(e);
                            });
                          }, false),
                          transferInput(context, 'Password', (e) {
                            setState(() {
                              password = e;
                            });
                          }, true),
                          uLogSizedBoxH(),
                          uLogSizedBoxH(),
                          LogButton(
                              size: size,
                              text: 'Deposit',
                              onTap: () async {
                                if (password == user.password ) {
                                  setState(() {
                                    _isLoad = true;
                                  });
                                  var response =
                                      await deposit.depositToSelfAccount(
                                    user.id,
                                    user.bankId,
                                    amount,
                                    user.currentUserPhoneNumber,
                                    user.depositId,
                                  );
                                  if (response == 'success') {
                                    setState(() {
                                      _isLoad = false;
                                    });
                                    Navigator.pushReplacementNamed(
                                        context, NavigationBottomTab.id);
                                    logDialog('Done', context, Icons.done_all, Colors.green);
                                  }
                                } else {
                                  logDialog('Wrong password', context,
                                      Icons.error_outline_rounded, Colors.red);
                                }
                              })
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding transferInput(BuildContext context, String hintText,
      ValueChanged onChanged, bool isObscure) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: SizeConfig.blockSizeHorizontal! * 5,
        ),
        onChanged: (e) => onChanged(e),
        // validator: (value) {
        //   // if (value!.isEmpty ||
        //   //     value.contains(' ') ||
        //   //     value.contains('@') ||
        //   //     value.contains('.')) {
        //   //   return 'Invalid Username';
        //   // }
        // },
        obscureText: isObscure,
        decoration: InputDecoration(
          fillColor: AppColor().kGrayThreeColor.withOpacity(0.5),
          filled: true,
          labelStyle: TextStyle(
              color:
                  Theme.of(context).colorScheme.onSecondary.withOpacity(0.75)),
          label: Text(
            hintText,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor().kGrayOneColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor().kGrayOneColor,
              width: 2.5,
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
            fontSize: SizeConfig.blockSizeHorizontal! * 5,
          ),
        ),
      ),
    );
  }
}
