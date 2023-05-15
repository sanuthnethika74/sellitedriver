import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/controllers/homescreen/home_screen_controller.dart';
// import 'package:sellite/controllers/home_screen/home_screen_controller.dart';

class NavigationDrawerController extends GetxController {
  final HomeScreenController homeScreenController = Get.find();

  goToHomePage() {
    homeScreenController.selectedIndex.value = 0;
  }

  // goToHistory() {
  //   homeScreenController.selectedIndex.value = 1;
  // }

  goToProfile() {
    homeScreenController.selectedIndex.value = 1;
  }
}
