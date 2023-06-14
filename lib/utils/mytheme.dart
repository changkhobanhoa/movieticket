import 'package:flutter/material.dart';

class MyTheme {
  static List<Color> redGiftGradientColors = [
    const Color(0xFFFCCAC6).withOpacity(0.3),
    const Color(0xFFDB5449).withOpacity(0.3),
  ];
  static const redTextColor = Color(0xFFD05045);
  static const greenTextColor = Color(0xFF8CC153);

  static const greenColor = Color(0xFF2EC492);
  static const orangeColor = Color(0xFFEB8D2F);
  static const greyColor = Color(0xFFF4F4F4);
  static const blueBorder = Color(0xFF3164CE);
  static const redBorder = Color(0xFFF14336);

  static List<Color> greenGiftGradientColors = [
    const Color(0xFF89D980).withOpacity(0.3),
    const Color(0xFF34BA25).withOpacity(0.3),
  ];
  
  static Color? splash = Colors.blue[300];
  static const appBarColor = Color(0xFF222539);
  static final myLightTheme = ThemeData(
    primaryColor: splash,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.black,
      labelStyle: TextStyle(color: Colors.black),
    ),
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(
        background: splash!,
        primary: splash!,
      ),
    ),
    appBarTheme: const AppBarTheme(color: Colors.transparent),
  );

  static final myDarkTheme = ThemeData(
    primaryColor: splash,
    scaffoldBackgroundColor: appBarColor,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.dark(
        background: splash!,
        primary: splash!,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: appBarColor,
    ),
  );
}
