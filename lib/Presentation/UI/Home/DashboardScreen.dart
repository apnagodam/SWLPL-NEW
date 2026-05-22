// ignore_for_file: must_be_immutable

import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/UI/Home/HomeScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Home/OptionsScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Profile/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  DashboardScreen({super.key});

  var dashBoardScreens = [HomeScreen(), OptionsScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: androidLayout(),
    );
  }

  iosLayout() => CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            activeIcon: Icon(
              CupertinoIcons.home,
              color: primaryColorDark,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.option),
            activeIcon: Icon(
              CupertinoIcons.option,
              color: primaryColorDark,
            ),
            label: 'Options',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            activeIcon: Icon(
              CupertinoIcons.person,
              color: primaryColorDark,
            ),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, index) => CupertinoTabView(
            builder: (context) => dashBoardScreens[index],
          ));

  androidLayout() => Scaffold(
        body: HomeScreen(),
      );
}
