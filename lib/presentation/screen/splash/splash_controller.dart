import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/res.dart';
import '../../routes/route_names.dart';
import '../../routes/routes.dart';
import '../export.dart';
import 'export.dart';

class SplashPresenterImpl extends SplashController with StateMixin<Splash> {
  final SharedPreferences storage;

  SplashPresenterImpl(this.storage);

  bool isInitialized = false;

  @override
  void initialize({required BuildContext context}) async {
    initAppResources(context);
    Future.delayed(const Duration(seconds: 3), () => navigateToTabs());

  }

  @override
  void initAppResources(BuildContext context) {
    if (isInitialized) {
      return;
    }

    isInitialized = true;
    initializeResources(context: context);
  }

  @override
  void navigateToTabs() {
    AppRoutes.appRoutes(RouteNames.home);
  }
}
