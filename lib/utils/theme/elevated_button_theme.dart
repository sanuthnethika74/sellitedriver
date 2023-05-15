import 'package:flutter/material.dart';
import 'package:sellitedriver/constants/colors.dart';

class CElevatedButtonTheme {
  CElevatedButtonTheme._(); //To avoid creating instants

  //Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData();

  //Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(cDarkPrimaryColor)));
}
