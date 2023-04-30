import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../export.dart';

class HomeRepoImpl implements HomeRepo {
  final EndPoints endPoints;
  final NetworkHelper helper;
  final SharedPreferences storage;

  HomeRepoImpl(this.endPoints, this.helper, this.storage);

  @override
  Future<Either<AppError, Weather>> getCurrentWeather(String userLocation) async {
    try {
      var res = await helper.get(endPoints.getWeatherStatus(userLocation));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());

        return Right(Weather.fromJson(data));
      } else if (res.statusCode == 401) {
        return Left(AppError(title: res.body));
      } else {
        return Left(AppError(title: 'error'));
      }
    } catch (error) {
      print(error);
      return Left(AppError(title: error.toString()));
    }
  }
}
