import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_banking/constant/colors.dart';
import 'package:simple_banking/provider/app_data.dart';
import 'package:simple_banking/util/utils.dart';
import 'package:simple_banking/widgets/account_scroll_card.dart';

class HomeScreen extends StatefulWidget {
  static const id = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = context.read<AppData>().user;
    final userFunc = context.watch<AppData>();
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            uSafeAreaSizedBox,
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(
                    'assets/image/adebayoAdesina.jpg',
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
            Container(
              height: SizeConfig.screenHeight! * 0.85,
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: [
                    Row(
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
                                    .withOpacity(0.9),
                              ),
                            ),
                            Text(
                              '₦ ${userFunc.getBalance().toStringAsFixed(0)}',
                              style: TextStyle(
                                letterSpacing: 1.1,
                                fontSize: SizeConfig.blockSizeHorizontal! * 7,
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
                            color: Theme.of(context).colorScheme.onSecondary,
                            size: 28,
                          ),
                        ),
                        
                      ],
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: user.accounts!.length,
                            itemBuilder: ((context, index) {
                              final account = user.accounts![index];
                              return AccountScrollCard(
                                accountType: account.accountTitle.toString(),
                                amount: account.accountBalance as double,
                              );
                            }),
                          ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
