import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/controllers/settings/settings_controller.dart';
import 'package:sellitedriver/routes/app_route.dart';
import 'package:sellitedriver/utils/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SelliteAppTheme.lightTheme,
      darkTheme: SelliteAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      defaultTransition: Transition.rightToLeftWithFade,
      getPages: appRoutes,
      initialRoute: '/',
    );
  }
}

// :::::::::::::::::::::::::::::::::::::::::::::::::::::Device Preview
// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => MyApp(), // Wrap your app
//       ),
//     );

// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//   SettingsController settingsController = Get.put(SettingsController());

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       useInheritedMediaQuery: true,
//       locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,

//       getPages: appRoutes,
//       // theme data
//       theme: SJICAppTheme.lightTheme,
//       darkTheme: SJICAppTheme.darkTheme,
//       themeMode: ThemeMode.system,
//       defaultTransition: Transition.rightToLeftWithFade,
//     );
//   }
// }
