import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_banking/constant/colors.dart';
import 'package:simple_banking/provider/app_data.dart';
import 'package:simple_banking/routes/route.dart';

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
      ],
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
            
            appBarTheme:
                AppBarTheme(backgroundColor: AppColor().kGrayOneColor)),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
