import 'package:berita_app/controller/network_controller.dart';
import 'package:berita_app/controller/page_view_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // NOTE : CONTROLLER HERE
    Get.lazyPut(() => PageViewController());
    Get.lazyPut(() => NetworkController());
  }
}
