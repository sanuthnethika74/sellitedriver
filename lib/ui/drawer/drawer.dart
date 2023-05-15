import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/constants/image_strings.dart';

import '../../constants/colors.dart';
import '../../controllers/drawer/drawer_controller.dart';
import '../../controllers/login_screen/login_screen_controller.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  final navigationDrawerController = Get.put(NavigationDrawerController());
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Container(
      color: Get.isDarkMode ? cDarkPrimaryColor : cPrimaryColor,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 52,
            backgroundColor: cWhiteColor,
            backgroundImage: AssetImage(LogoJpg),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "VEGESTALL",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 8,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: () {
              navigationDrawerController.goToHomePage();
              Navigator.pop(context);
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.delivery_dining_outlined),
          //   title: const Text("History"),
          //   onTap: () {
          //     navigationDrawerController.goToHistory();
          //     Navigator.pop(context);
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text("Profile"),
            onTap: () {
              navigationDrawerController.goToProfile();
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings_sharp),
            title: const Text("Settings"),
            onTap: () {
              Get.toNamed('/settings');
            },
          ),
          const Divider(),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    loginController.logOut();
                  },
                  child: const Text("Sign Out"))),
          Center(
            child: TextButton(
                onPressed: () {}, child: const Text("Report issue?")),
          )
        ],
      ),
    );
  }
}
