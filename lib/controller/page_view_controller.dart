import 'package:berita_app/view/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewController extends GetxController {
  Widget _currentScreen = const HomePage();
  int _navigatorIndex = 0;

  Widget get currentScreen => _currentScreen;

  int get navigatorIndex => _navigatorIndex;

  changeCurrentScreen(int index) {
    _navigatorIndex = index;
    switch (index) {
      case 0:
        _currentScreen = const HomePage();
        break;
      case 1:
        _currentScreen = const SecondPage();
        break;
      case 2:
        _currentScreen = const ThreePage();
        break;
      case 3:
        _currentScreen = const FourPage();
        break;
    }
    update();
  }
}
