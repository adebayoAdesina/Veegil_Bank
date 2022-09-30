import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simple_banking/constant/colors.dart';
import 'package:simple_banking/model/transfer.dart';
import 'package:simple_banking/provider/sign_user.dart';
import 'package:simple_banking/provider/app_data.dart';
import 'package:simple_banking/provider/transfer_provider.dart';
import 'package:simple_banking/routes/route.dart';
import 'package:simple_banking/screens/log_in_or_sign_up_screen.dart';
import 'package:simple_banking/screens/navigation_bottom_tab.dart';
import 'package:simple_banking/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppData(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUser(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppColor(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransferProvider(),
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0XFF4D4B4F), 
        systemNavigationBarIconBrightness: Brightness.light,
      ),
        
        child: MaterialApp(
          title: 'SimpleBank',
          theme: ThemeData(
            colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: AppColor().kYellowColor,
              onPrimary: AppColor().kWhiteColor,
              secondary: AppColor().kYellowColor,
              onSecondary: AppColor().kWhiteColor,
              error: AppColor().kErrorColor,
              onError: AppColor().kWhiteColor,
              background: AppColor().kGrayOneColor,
              onBackground: AppColor().kWhiteColor,
              surface: AppColor().kGrayOneColor,
              onSurface: AppColor().kWhiteColor,
            ),
            scaffoldBackgroundColor: AppColor().kGrayOneColor,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColor().kGrayOneColor,
            ),
          ),
          initialRoute: SplashScreen.id,
          // initialRoute: NavigationBottomTab.id,
          routes: routes,
        ),
      ),
    );
  }
}
