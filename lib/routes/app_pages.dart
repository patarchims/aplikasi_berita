part of 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: RouteNames.home,
        // binding: Binding(),
        page: () => const HomePage()),
    GetPage(
        name: RouteNames.categoryPageAppBar,   page: () => const DetailPage()),
  ];
}
