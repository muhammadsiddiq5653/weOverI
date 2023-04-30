import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../export.dart';

class Splash extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.initialize(context: context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              assets.background1,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
