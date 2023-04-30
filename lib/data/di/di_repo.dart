import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../export.dart';

class RepoDependencies {
  // late FirebaseAuth _firebaseAuth;
  late NetworkHelper _networkHelper;
  late EndPoints _endPoints;
  late SharedPreferences _sharedPreferences;

  Future init() async {
    // await Firebase.initializeApp();
    // _firebaseAuth = FirebaseAuth.instance;
    _sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => _sharedPreferences);
    _endPoints = EndPoints();
    _networkHelper = NetworkHelperImpl(_sharedPreferences);

    Get.lazyPut<HomeRepo>(
      () => HomeRepoImpl(_endPoints, _networkHelper, _sharedPreferences),
      fenix: true,
    );
  }
}
