import 'package:get/get.dart';
import 'package:sellitedriver/controllers/signup/signup_controller.dart';
import 'package:sellitedriver/ui/Settings/settings.dart';
import 'package:sellitedriver/ui/detailspage/details_page.dart';
import 'package:sellitedriver/ui/homescreen/homescreen.dart';
import 'package:sellitedriver/ui/loginscreen/login_screen.dart';
import 'package:sellitedriver/ui/notifications/notifications.dart';
import 'package:sellitedriver/ui/singup/singup_screen.dart';
import 'package:sellitedriver/ui/splashscreen/splashscreen.dart';

var appRoutes = [
  GetPage(name: "/", page: () => SplashScreen()),
  GetPage(name: "/login", page: () => LoginPage()),
  GetPage(name: "/dashboard", page: () => HomeScreen()),
  GetPage(name: "/notifications", page: () => Notifications()),
  GetPage(name: '/settings', page: () => SettingsPage()),
  GetPage(name: '/signup', page: () => SingupPage()),
  GetPage(name: '/vieworder', page: () => DetailsPage()),

// attendance, lessonplan, syllabus, downloadcenter, fees
];
