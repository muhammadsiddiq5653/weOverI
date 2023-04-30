import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../../export.dart';

class HomePageController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin<HomePage> {
  final HomeUseCase useCase;

  HomePageController(this.useCase);

  RxBool apiLoading = true.obs;
  Position position = Position(
      longitude: 12.0,
      latitude: 12.0,
      timestamp: DateTime.now(),
      accuracy: 12.0,
      altitude: 12.0,
      heading: 12.0,
      speed: 12.0,
      speedAccuracy: 12.0);

  late TabController tabController;
  RxInt selectedIndex = 0.obs;

  List<String> tabs = ['Overview', 'Training', 'Symptoms'];

  Weather get weatherStatus => useCase.weatherStatus;

  bool fetchWeatherOnUserLocation = false;

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(onTabChange);
    getUserCurrentPostion();
    getData(false);
  }

  getUserCurrentPostion() async {
    position = await useCase.determinePosition();
    print(position.toString());
  }

  getData(bool currentLocation) async {
    String userLocation = "${position.latitude},${position.longitude}";
    apiLoading.value = true;
    await useCase.getWeatherStatus(currentLocation ? userLocation : 'London');
    apiLoading.value = false;
  }

  onTabChange() {
    if (selectedIndex.value == 1) {
      getData(true);
    } else {
      getData(false);
    }
    selectedIndex.value = tabController.index;
  }
}
