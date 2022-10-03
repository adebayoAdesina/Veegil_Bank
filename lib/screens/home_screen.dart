import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/sign_user.dart';
import '../widgets/transaction_section.dart';
import '../constant/colors.dart';
import '../provider/app_data.dart';
import '../util/utils.dart';
import '../widgets/account_scroll_list_card.dart';
import '../widgets/finance_section.dart';
import '../widgets/user_deposit_section.dart';
import '../widgets/user_withdraw_section.dart';

class HomeScreen extends StatefulWidget {
  // static const id = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    
    final user = context.watch<AppData>().user;
    final userFunc = context.read<AppData>();
    final getSignIn = context.watch<AppData>();
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    // print(user.received);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: ()=>userFunc.getUser(SignUser(phoneNumber: getSignIn.currentUserPhoneNumber, password: getSignIn.password)),
        child: SafeArea(
          child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: 
        //       StreamBuilder(
        //         initialData: 0,
        //         stream: userFunc.getusers(const Duration(seconds: 1)),
        // builder: (context, snapshot) =>
        Column(
                  children: [
                    uSafeAreaSizedBox,
                    Padding(
                      padding: uHorizontalPadding,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(
                              'https://th.bing.com/th/id/OIP.vmIIvAl_TkD0340tgTb0UwHaHa?pid=ImgDet&rs=1',
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                uLogAppLogo(size.width * 0.35),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: uContentPadding,
                          child: Column(
                            children: [
                              uContentSizedBoxH(),
                              Padding(
                                padding: uRightContentPadding,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Your balance',
                                          style: TextStyle(
                                            fontSize: SizeConfig.headingFontSize,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary
                                                .withOpacity(0.75),
                                          ),
                                        ),
                                        Text(
                                          '₦ ${userFunc.getBalance().toStringAsFixed(0)}',
                                          style: TextStyle(
                                            letterSpacing: 1.1,
                                            fontSize:
                                                SizeConfig.blockSizeHorizontal! * 7,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary
                                                .withOpacity(0.9),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: AppColor().kGrayThreeOpacityColor,
                                          borderRadius: BorderRadius.circular(50)),
                                      child: Icon(
                                        Icons.search,
                                        color:
                                            Theme.of(context).colorScheme.onSecondary,
                                        size: 28,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            uContentSizedBoxH(),
                            uContentSizedBoxH(),
                            SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: AccountScrollListCard(
                                userAccount: user.accounts!,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: uContentPadding,
                          child: Column(
                            children: [
                              uContentSizedBoxH(),
                              uContentSizedBoxH(),
                              FinanceSection(
                                bonus: user.accounts![0].accountBalance as double,
                              ),
                              uContentSizedBoxH(),
                              uContentSizedBoxH(),
                              const TransactionSection(),
                              uContentSizedBoxH(),
                              uContentSizedBoxH(),
                              uContentSizedBoxH(),
                              const UserDepositSection(),
                              uContentSizedBoxH(),
                              uContentSizedBoxH(),
                              uContentSizedBoxH(),
                              const UserWithdrawSection(),
                              uSafeAreaSizedBox,
                              uSafeAreaSizedBox
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        // ),
      
    );
  }
}
