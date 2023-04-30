import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SplashController extends GetxController {
  void initialize({required BuildContext context});

  void initAppResources(BuildContext context);

  void navigateToTabs();
}
