import 'package:get/get.dart';

import '../screen/export.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashPresenterImpl(Get.find()));
  }
}
