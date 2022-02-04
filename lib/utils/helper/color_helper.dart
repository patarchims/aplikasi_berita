import 'package:flutter/material.dart';

class ThemeColor {
  static Color primaryColor = const Color(0xFF005CB0);
  static Color dangerColor = const Color(0xFFFE734C);
  static Color whiteColor = const Color(0xFFF8F8F8);
  static Color blackColor = const Color(0xFF020202);
  static Color greyColor = const Color(0xFF8D92A3);
  static Color lightGrey = const Color(0xFFEEEEEE);
  static Color yellowColor = const Color(0xFFFBD460);
  static Color transparentColor = const Color(0xFFFFFFFF).withOpacity(0.5);
  static Color greenColor = const Color(0xFF03AD00);
  static const MaterialColor darkBlueColor =
      MaterialColor(0xFF005CB0, <int, Color>{
    50: Color(0xFF00539e), // 10%
    100: Color(0xFF004a8d), //20%
    200: Color(0xFF00407b), //30%
    300: Color(0xFF00376a), //40%
    400: Color(0xFF002e58), //50%
    500: Color(0xFF002546), //60%
    600: Color(0xFF001c35), //70%
    700: Color(0xFF001223), //80%
    800: Color(0xFF000912), //90%
    900: Color(0xFF000000), //100%
  });
}
