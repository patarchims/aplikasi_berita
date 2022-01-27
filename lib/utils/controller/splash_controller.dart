part of 'controller.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    // Get.toNamed(RouteNames.splashPage);
    // Get.to(() => const ControlView());
    Get.to(const ControlView());
  }
}
