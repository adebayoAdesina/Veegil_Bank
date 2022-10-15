import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../constant/colors.dart';
import '../provider/deposit_provider.dart';
import '../provider/sign_user.dart';
import '../provider/app_data.dart';
import '../provider/transfer_provider.dart';
import '../routes/route.dart';
import '../screens/splash_screen.dart';
import 'screens/navigation_bottom_tab.dart';

void main() async {
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
          create: (context) => TransferProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DepositProvider(),
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0XFF4D4B4F),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: MaterialApp(
          color: const Color(0XFF252525),
          debugShowCheckedModeBanner: false,
          title: 'Veegil Bank',
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
          // initialRoute: SplashScreen.id,
          initialRoute: NavigationBottomTab.id,
          routes: routes,
        ),
      ),
    );
  }
}
