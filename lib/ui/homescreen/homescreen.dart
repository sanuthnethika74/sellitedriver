import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sellitedriver/constants/colors.dart';
import 'package:sellitedriver/controllers/homescreen/home_screen_controller.dart';
import 'package:sellitedriver/ui/drawer/drawer.dart';
import 'package:sellitedriver/ui/homescreen/dashboard/dashboard.dart';
import 'package:sellitedriver/ui/homescreen/history/history.dart';
import 'package:sellitedriver/ui/homescreen/profile/profile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  final screens = [
    Dashboard(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text(
            "VEGESTALL",
            style: Theme.of(context).textTheme.headline5,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                homeScreenController.goToNotifications();
              },
              icon: Icon(Icons.notifications),
            )
          ],
        ),
        body: Obx(() => screens[homeScreenController.selectedIndex.value]),
        bottomNavigationBar: Container(
          color: Get.isDarkMode ? cDarkPrimaryColor : cPrimaryColor,
          child: Padding(
            padding: EdgeInsets.only(
              left: Get.width * 0.2,
              right: Get.width * 0.2,
              bottom: 8,
              top: 8,
            ),
            child: Obx(
              () => GNav(
                gap: 8,
                backgroundColor:
                    Get.isDarkMode ? cDarkPrimaryColor : cPrimaryColor,
                color: cWhiteColor,
                activeColor: Get.isDarkMode ? cDarkPrimaryColor : cPrimaryColor,
                tabBackgroundColor: Get.isDarkMode ? cgray : cWhiteColor,
                padding: EdgeInsets.all(15.0),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  // GButton(
                  //   icon: Icons.delivery_dining,
                  //   text: 'History',
                  // ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: homeScreenController.selectedIndex.value,
                onTabChange: (index) {
                  homeScreenController.changeIndex(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    return showDialog(
      context: Get.overlayContext ?? Get.context!,
      builder: (context) => AlertDialog(
        title: Text(
          "Confirm exit",
          style: Theme.of(context).textTheme.headline3,
        ),
        content: Text(
          "Are you sure you want to exit the app?",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("No"),
          ),
          TextButton(
            onPressed: () => exit(0),
            child: Text("Yes"),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }
}
