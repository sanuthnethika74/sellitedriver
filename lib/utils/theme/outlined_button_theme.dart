
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class COutlinedButtonTheme {
  COutlinedButtonTheme._(); //To avoid creating instants

  //Light Theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData();

  //Dark Theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style:
      OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: cWhiteColor,
        side: BorderSide(color: cPrimaryColor),
      )
  );
  
}
