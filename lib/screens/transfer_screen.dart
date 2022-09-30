import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_banking/screens/navigation_bottom_tab.dart';
import 'package:simple_banking/widgets/log_button.dart';
import 'package:simple_banking/widgets/transaction_alert.dart';

import '../constant/colors.dart';
import '../util/utils.dart';

// https://giphy.com/embed/rx8Bp7bOYUiTv4NEWA

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  bool _changed = false;
  @override
  Widget build(BuildContext context) {
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
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
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
                      child: _changed == false
                          ? Column(
                              children: [
                                transferInput(
                                    context, 'Account number', (e) {}, false),
                                transferInput(context, 'Amount', (e) {}, false),
                                transferInput(
                                    context, 'Description', (e) {}, false),
                                uLogSizedBoxH(),
                                LogButton(
                                    size: size,
                                    text: 'Procced',
                                    onTap: () {
                                      setState(() {
                                        _changed = !_changed;
                                      });
                                    })
                              ],
                            )
                          : Column(
                              children: [
                                transferInput(
                                    context, 'Password', (e) {}, false),
                                uLogSizedBoxH(),
                                LogButton(
                                    size: size,
                                    text: 'Transfer',
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              TransactionAlert(
                                                  title: 'Are you sure?',
                                                  subTitle:
                                                      'Click yes to proceed transaction',
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
                                    }),
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
