import 'package:flutter/material.dart';
import '../screens/transaction_screen.dart';
import '../constant/colors.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class NavigationBottomTab extends StatefulWidget {
  static const id = '/navigation'; 
  const NavigationBottomTab({Key? key}) : super(key: key);

  @override
  State<NavigationBottomTab> createState() => _NavigationBottomTabState();
}

class _NavigationBottomTabState extends State<NavigationBottomTab> {
  int _selectedIndex = 0;

  @override


  final List<dynamic> _pages = const [
    HomeScreen(),
    TransactionScreen(),
    ProfileScreen(),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40),),
        child: WaterDropNavBar(
          backgroundColor: AppColor().kGrayThreeOpacityColor,
          waterDropColor: Theme.of(context).colorScheme.primary,
          inactiveIconColor: Theme.of(context).colorScheme.onSecondary.withOpacity(0.5),
          iconSize: 30,
          bottomPadding: 10,
          barItems: [
            BarItem(
              filledIcon: Icons.home,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
              filledIcon: Icons.multiple_stop,
              outlinedIcon: Icons.swap_vert_rounded,
            ),
            BarItem(
              filledIcon: Icons.person,
              outlinedIcon: Icons.person_outline,
            )
          ],
          selectedIndex: _selectedIndex,
          onItemSelected: (e) => setState(
            () {
              _selectedIndex = e;
            },
          ),
        ),
      ),
    );
  }
}
