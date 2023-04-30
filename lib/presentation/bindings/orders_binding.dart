import 'package:get/get.dart';

import '../../export.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController(Get.find()));
    // Get.put<Service>(()=> Api());
  }
}
