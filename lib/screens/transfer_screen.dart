

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../provider/sign_user.dart';
import '../provider/transfer_provider.dart';
import '../screens/navigation_bottom_tab.dart';
import '../widgets/log_button.dart';
import '../widgets/transaction_alert.dart';

import '../constant/colors.dart';
import '../provider/app_data.dart';
import '../util/utils.dart';

class TransferScreen extends StatefulWidget {
  static const id = 'transfer';
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  bool _changed = false;
  String phoneNumber = '';
  double amount = 0;
  String description = '';
  String password = '';
  bool _isLoad = false;
  @override
  Widget build(BuildContext context) {
    final user = context.watch<AppData>();
    final userSalary = user.user.accounts!
        .firstWhere((element) => element.accountTitle == 'Savings account');

    final _transfer = context.read<TransferProvider>();
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    String _url =
        'https://img.freepik.com/free-vector/vector-illustration-realistic-style-concept-mobile-payments-using-application-your-smartphone_1441-231.jpg?w=1380&t=st=1664492546~exp=1664493146~hmac=3d2918ddefe25b6c1b20a0ab6545b31437e4c3e39b87efb8e4f178f1b9447e88';
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Transfer',
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
                        child: _changed == false
                            ? Column(
                                children: [
                                  transferInput(context, 'Account number', (e) {
                                    setState(() {
                                      phoneNumber = e;
                                    });
                                  }, false),
                                  transferInput(context, 'Amount', (e) {
                                    setState(() {
                                      amount = double.parse(e);
                                    });
                                  }, false),
                                  transferInput(context, 'Description', (e) {
                                    setState(() {
                                      description = e;
                                    });
                                  }, false),
                                  uLogSizedBoxH(),
                                  LogButton(
                                      size: size,
                                      text: 'Proceed',
                                      onTap: () {
                                        if (userSalary.accountBalance! >=
                                            amount) {
                                          setState(() {
                                            _changed = !_changed;
                                          });
                                        } else {
                                          logDialog(
                                              'Your cant transfer more than your ${userSalary.accountBalance}',
                                              context,
                                              Icons.error_outline_rounded,
                                              Colors.red);
                                        }
                                      })
                                ],
                              )
                            : Column(
                                children: [
                                  transferInput(context, 'Password', (e) {
                                    setState(() {
                                      password = e;
                                    });
                                  }, true),
                                  uLogSizedBoxH(),
                                  LogButton(
                                    size: size,
                                    text: 'Transfer',
                                    onTap: () async {
                                      if (user.user.number != phoneNumber ||
                                          user.user.password == password) {
                                        if (amount != 0 ||
                                            password != '' ||
                                            description != '') {
                                          setState(() {
                                            _isLoad = true;
                                          });
                                          var response =
                                              await _transfer.transfer(
                                            user.id,
                                            user.transferId,
                                            phoneNumber,
                                            amount,
                                            description,
                                            user.bankId,
                                            user.user,
                                          );
                                          setState(() {
                                            _isLoad = false;
                                          });

                                          if (response == 'success') {
                                            context.read<AppData>().getUser(
                                                  SignUser(
                                                    phoneNumber: user
                                                        .currentUserPhoneNumber,
                                                  ),
                                                );

                                            Navigator.pushReplacementNamed(
                                              context,
                                              NavigationBottomTab.id,
                                            );
                                            logDialog('Done', context,
                                                Icons.done_all, Colors.green);
                                          }
                                        }
                                      } else if (user.user.number ==
                                          phoneNumber) {
                                        logDialog(
                                            'You cant transfer to your account',
                                            context,
                                            Icons.error_outline_rounded,
                                            Colors.red);
                                      } else if (user.user.password !=
                                          password) {
                                        logDialog(
                                          'Wrong Password',
                                          context,
                                          Icons.error_outline_rounded,
                                          Colors.red,
                                        );
                                      }
                                    },
                                  ),
                                  uLogSizedBoxH(),
                                  LogButton(
                                      size: size,
                                      text: 'Cancel',
                                      isMain: false,
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                TransactionAlert(
                                                    title: 'Are you sure?',
                                                    subTitle:
                                                        'Click yes to cancel transaction',
                                                    noFunction: () =>
                                                        Navigator.pop(context),
                                                    yesFunction: () {
                                                      Navigator
                                                          .pushReplacementNamed(
                                                        context,
                                                        NavigationBottomTab.id,
                                                      );
                                                      setState(() {
                                                        _changed = !_changed;
                                                      });
                                                    }));
                                      })
                                ],
                              ),
                      ),
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
              const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
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
