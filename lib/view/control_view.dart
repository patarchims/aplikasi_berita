import 'package:berita_app/controller/controller.dart';
import 'package:berita_app/helper/theme.dart';
import 'package:berita_app/view/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<NetworkController>().connectionStatus.value == 1 ||
              Get.find<NetworkController>().connectionStatus.value == 2
          ? GetBuilder<PageViewController>(
              init: PageViewController(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: const CustomBottomNavigationBar(),
              ),
            )
          : const NoConnectionInternetPage();
    });
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 84.h,
      child: GetBuilder<PageViewController>(
        builder: (controller) => BottomNavigationBar(
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.navigatorIndex,
          backgroundColor: colorScheme.surface,
          selectedItemColor: blueColor,
          unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
          selectedLabelStyle: textTheme.caption,
          unselectedLabelStyle: textTheme.caption,
          selectedFontSize: 28,
          onTap: (index) {
            controller.changeCurrentScreen(index);
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: FaIcon(
                FontAwesomeIcons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Video',
              icon: FaIcon(FontAwesomeIcons.list),
            ),
            BottomNavigationBarItem(
              label: 'Video',
              icon: FaIcon(FontAwesomeIcons.video),
            ),
            BottomNavigationBarItem(
              label: 'Redaksi',
              icon: FaIcon(FontAwesomeIcons.users),
            ),
          ],
        ),
      ),
    );
  }
}
