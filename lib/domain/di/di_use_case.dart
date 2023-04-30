import 'package:get/get.dart';

import '../../export.dart';

Future<void> initializeUseCasesDependencies() async {
  final RepoDependencies repoDependencies = RepoDependencies();
  await repoDependencies.init();

  Get.lazyPut<HomeUseCase>(
    () => HomeUseCase(
      Get.find<HomeRepo>(),
    ),
    fenix: true,
  );
}
