import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../export.dart';

class AppRoutes {
  static List<GetPage> getPage = [
    GetPage(
      name: RouteNames.splash,
      page: () => Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteNames.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),

  ];

  static Future<dynamic>? appRoutes(final String routeName, {arg}) {
    switch (routeName) {
      case RouteNames.splash:
        return Get.toNamed(routeName, arguments: arg);
      case RouteNames.home:
        return Get.offAllNamed(routeName, arguments: arg);
      default:
        return _errorRoute();
    }
  }

  static Future<dynamic>? _errorRoute() {
    return Get.to(Container());
  }
}
