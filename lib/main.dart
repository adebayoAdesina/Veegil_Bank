import 'package:flutter/material.dart';
import 'package:simple_banking/constant/colors.dart';
import 'package:simple_banking/routes/route.dart';
import 'package:simple_banking/screens/log_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          appBarTheme: AppBarTheme(backgroundColor: AppColor().kGrayOneColor)
      ),
      initialRoute: LogInScreen.id,
      routes: routes,
    );
  }
  
}

