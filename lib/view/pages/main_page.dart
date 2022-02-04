import 'package:berita_app/utils/helper/theme.dart';
import 'package:berita_app/view/pages/category/categori.dart';
import 'package:berita_app/view/pages/pages.dart';
import 'package:berita_app/view/pages/video/video_page.dart';
import 'package:berita_app/view/widgets/alert/alert.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;
  final bool isExpired;

  const MainPage({Key? key, this.bottomNavBarIndex = 0, this.isExpired = false})
      : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int bottomNavBarIndex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    bottomNavBarIndex = widget.bottomNavBarIndex;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return WillPopScope(
      onWillPop: () async {
        // ON BACK
        final shouldPop = await Alert.showWarning(
          context,
        );

        return shouldPop ?? false;
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        bottomNavigationBar: SizedBox(
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: bottomNavBarIndex,
            backgroundColor: colorScheme.surface,
            selectedItemColor: Colors.blue,
            unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
            selectedLabelStyle: textTheme.caption,
            unselectedLabelStyle: textTheme.caption,
            selectedFontSize: 28,
            onTap: (index) {
              setState(() {
                bottomNavBarIndex = index;
                pageController.jumpToPage(index);
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: FaIcon(
                  FontAwesomeIcons.home,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Category',
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
        body: Stack(
          children: <Widget>[
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  bottomNavBarIndex = index;
                });
              },
              children: const <Widget>[
                HomePage(),
                CategoryPage(),
                VideoPage(),
                RedaksiPage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
