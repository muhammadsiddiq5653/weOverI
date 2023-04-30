import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeUseCasesDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test Task',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xfFFFFFFA)),
        backgroundColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.splash,
      getPages: AppRoutes.getPage,
      smartManagement: SmartManagement.keepFactory,
      showPerformanceOverlay: false,
    );
  }
}
