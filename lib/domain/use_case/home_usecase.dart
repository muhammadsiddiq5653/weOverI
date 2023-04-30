import 'package:geolocator/geolocator.dart';

import '../../export.dart';

class HomeUseCase {
  final HomeRepo repo;

  HomeUseCase(this.repo);

  Weather _weatherStatus =
      Weather(location: '', icon: '', tempF: 0, status: '');

  Weather get weatherStatus => _weatherStatus;

  Future<void> getWeatherStatus(String userLocation) async {
    var res = await repo.getCurrentWeather(userLocation);
    return res.fold(
      (error) {
        print(error);
      },
      (data) {
        _weatherStatus = data;
      },
    );
  }
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

}
