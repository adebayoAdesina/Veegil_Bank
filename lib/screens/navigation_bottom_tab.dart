import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../constant/colors.dart';
import '../provider/app_data.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class NavigationBottomTab extends StatefulWidget {
  static const id = '/'; 
  const NavigationBottomTab({Key? key}) : super(key: key);

  @override
  State<NavigationBottomTab> createState() => _NavigationBottomTabState();
}

class _NavigationBottomTabState extends State<NavigationBottomTab> {
  int _selectedIndex = 0;

  bool _isLoading = true;
  @override
  void initState() {
    // context.watch<AppData>().isLoading;
    super.initState();
  }
GestureDetector getGesture (context) {
    return GestureDetector(onTap: (() => context.read<AppColor>().changeColor()));
  }
  final List<dynamic> _pages = [
    HomeScreen(),
    Scaffold(),
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
              filledIcon: Icons.color_lens,
              outlinedIcon: Icons.color_lens_outlined,
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
