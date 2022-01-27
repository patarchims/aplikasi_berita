import 'package:berita_app/utils/controller/controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // NOTE : CONTROLLER HERE
    Get.lazyPut(() => PageViewController());
    Get.lazyPut(() => NetworkController());
    
  }
}
