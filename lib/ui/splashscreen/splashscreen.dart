import 'package:flutter/material.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/constants/image_strings.dart';

import '../../constants/colors.dart';
import '../../controllers/splash_screen/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          PhloxAnimations(
            duration: const Duration(seconds: 3),
            fromOpacity: 0,
            child: Center(
              child: Container(
                  width: 200,
                  height: 200,
                  child: const Image(image: AssetImage(LogoIntroPng))),
            ),
          ),
        ],
      ),
    );
  }
}
