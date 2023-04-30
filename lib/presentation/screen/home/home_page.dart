import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../export.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return _getBody();
  }

  Widget _getBody() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    assets.background1,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            children: [
              SafeArea(
                child: getAppBar(),
              ),
              getTabsBars(),
              getTabs(),
            ],
          ),
        ],
      ),
    );
  }

  getAppBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          assets.userImage,
          width: sizes.widthRatio * 26,
          height: sizes.heightRatio * 26,
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        horizontalSpacer(
          sizes.widthRatio * 30,
        ),
        Column(
          children: [
            Text(
              'Today',
              style: textStyles.euclidRegular.copyWith(
                color: Colors.white,
                fontSize: sizes.fontRatio * 19,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
        horizontalSpacer(
          sizes.widthRatio * 30,
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        const Spacer(),
        SvgPicture.asset(
          assets.notification,
        ),
      ],
    ).paddingAll(24);
  }

  getTabsBars() {
    return Obx(() {
      return TabBar(
          controller: controller.tabController,
          indicatorColor: Colors.white,
          indicator: const CustomTabIndicator(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          tabs: [
            Tab(
              child: Column(
                children: [
                  Text(
                    controller.tabs[0].toUpperCase(),
                    style: textStyles.cabinLight.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  verticalSpacer(17),
                  controller.selectedIndex.value != 0
                      ? Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 2),
                            ),
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
            Tab(
              child: Column(
                children: [
                  Text(
                    controller.tabs[1].toUpperCase(),
                    style: textStyles.cabinLight.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  verticalSpacer(sizes.heightRatio * 17),
                  controller.selectedIndex.value != 1
                      ? Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 2),
                            ),
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
            Tab(
              child: Column(
                children: [
                  Text(
                    controller.tabs[2].toUpperCase(),
                    style: textStyles.cabinLight.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  verticalSpacer(sizes.heightRatio * 17),
                  controller.selectedIndex.value != 2
                      ? Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 2),
                            ),
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            )
          ]);
    });
  }

  getTabs() {
    return Expanded(
      child: TabBarView(
        controller: controller.tabController,
        physics: const BouncingScrollPhysics(),
        children: controller.tabs.map((String tab) {
          switch (tab) {
            case 'Overview':
            case 'Training':
            case 'Symptoms':
              return Obx(
                () => controller.apiLoading.value
                    ? fullScreenLoader()
                    : controller.weatherStatus != null
                        ? getDataBody()
                        : Center(
                            child: Text(
                              'No Data found in this state',
                              style: textStyles.euclidLight,
                            ),
                          ),
              );

            default:
              return fullScreenLoader();
          }
        }).toList(),
      ),
    );
  }

  getDataBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Moderate readiness',
            style: textStyles.euclidRegular.copyWith(
              fontSize: sizes.fontRatio * 27,
              color: Colors.white,
            ),
          ),
          verticalSpacer(sizes.heightRatio * 10),
          Text(
            'You may need to adjust high intensity type training today',
            textAlign: TextAlign.center,
            style: textStyles.euclidRegular.copyWith(
              fontSize: sizes.fontRatio * 17,
              color: Colors.white,
            ),
          ),
          verticalSpacer(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  getLargeBox(),
                  Container(
                    width: sizes.width * 0.48,
                    height: sizes.heightRatio * 100,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    margin: const EdgeInsets.only(right: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: sizes.widthRatio * 60,
                          child: Text(
                            'Training Intensity',
                            maxLines: 2,
                            style: textStyles.euclidLight.copyWith(
                              fontSize: sizes.fontRatio * 11,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Med',
                          style: textStyles.cabinRegular.copyWith(
                            fontSize: sizes.fontRatio * 28,
                          ),
                        ),
                        horizontalSpacer(sizes.heightRatio * 10)
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    getSmallBox('Good', 'Sleep quality'),
                    getSmallBox('7.5', 'Sleep hours'),
                    getSmallBox('43', 'RHR'),
                  ],
                ),
              ),
            ],
          ),
          getBottomWidget(),
        ],
      ).paddingAll(20),
    );
  }

  final Shader linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.black.withOpacity(0.3), Colors.black],
  ).createShader(Rect.fromCircle(
    center: const Offset(100, -200),
    radius: 100 / 3,
  ));

  getSmallBox(String title, String subTitle) {
    return Container(
      width: double.infinity,
      height: sizes.heightRatio * 100,
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: textStyles.euclidBold.copyWith(
              fontSize: sizes.fontRatio * 24,
            ),
          ),
          verticalSpacer(
            sizes.heightRatio * 8,
          ),
          Text(
            subTitle,
            style: textStyles.euclidBold.copyWith(
              fontSize: sizes.fontRatio * 12,
            ),
          ),
        ],
      ),
    );
  }

  getLargeBox() {
    return GestureDetector(
      onTap: showMyDialog,
      child: Container(
        margin: const EdgeInsets.only(right: 10, top: 10),
        width: sizes.width * 0.48,
        height: sizes.heightRatio * 210,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            verticalSpacer(sizes.heightRatio * 8),
            CachedNetworkImage(
              imageUrl: 'https:${controller.weatherStatus.icon}',
              height: sizes.heightRatio * 64,
            ),
            Text(
              controller.weatherStatus.status,
              style: textStyles.euclidBold,
            ),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                begin: const Alignment(0.8, 0.3),
                end: const Alignment(1.0, 1),
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black,
                ],
              ).createShader(
                Rect.fromCircle(
                  center: const Offset(10, 80),
                  radius: 1,
                ),
              ),
              child: Text(
                controller.weatherStatus.tempF.toStringAsFixed(0),
                style: textStyles.euclidBold.copyWith(
                  fontSize: sizes.fontRatio * 80,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getBottomWidget() {
    return Column(
      children: [
        verticalSpacer(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Edit check-ins'.toUpperCase(),
              style: textStyles.euclidRegular.copyWith(
                  fontSize: sizes.fontRatio * 14, color: Colors.white),
            ),
            horizontalSpacer(6),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 12,
            )
          ],
        ),
        SizedBox(
            width: double.infinity,
            child: TimelineBar(
                currentDay: DateTime.now().day,
                daysInMonth: getNumberOfDays())),
        verticalSpacer(sizes.heightRatio * 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Current phase: ',
              style: textStyles.euclidRegular.copyWith(
                fontSize: sizes.fontRatio * 11,
                color: Colors.white,
              ),
            ),
            Text(
              'Mid Follicular',
              style: textStyles.euclidBold.copyWith(
                fontSize: sizes.fontRatio * 11,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            horizontalSpacer(4),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 10,
            )
          ],
        )
      ],
    );
  }

  getNumberOfDays() {
    DateTime now = DateTime.now();
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    return daysInMonth;
  }

  void showMyDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          height: sizes.heightRatio * 550,
          child: Stack(
            children: [
              Container(
                height: sizes.heightRatio * 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(assets.background2),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  margin: const EdgeInsets.only(top: 18),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: sizes.heightRatio * 300,
                  width: sizes.width * 0.8,
                  transform:
                      Matrix4(1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1)
                        ..rotateX(0)
                        ..rotateY(0)
                        ..rotateZ(0),
                  alignment: FractionalOffset.center,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      verticalSpacer(sizes.heightRatio * 100),
                      Text(
                        'The temperature is 58 degrees Fahrenheit and it is partially cloudy outside. Based on these conditions, it seems like a good day to hit the gym and do a high-intensity workout.',
                        style: textStyles.euclidRegular,
                      ),
                      verticalSpacer(sizes.heightRatio * 20),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Text(
                          'CLOSE',
                          style: textStyles.cabinLight
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                      verticalSpacer(sizes.heightRatio * 30),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${controller.weatherStatus.location} today',
                      style: textStyles.euclidRegular.copyWith(
                        fontSize: sizes.fontRatio * 40,
                        color: Colors.white,
                      ),
                    ),
                    verticalSpacer(sizes.heightRatio * 30),
                    getLargeDialogBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  getLargeDialogBox() {
    return GestureDetector(
      onTap: showMyDialog,
      child: Container(
        margin: const EdgeInsets.only(right: 10, top: 10),
        width: sizes.width * 0.45,
        height: sizes.heightRatio * 190,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 8)]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpacer(sizes.heightRatio * 8),
            CachedNetworkImage(
              imageUrl: 'https:${controller.weatherStatus.icon}',
              height: sizes.heightRatio * 64,
            ),
            Text(
              controller.weatherStatus.status,
              style: textStyles.euclidBold,
            ),
            Text(
              '${controller.weatherStatus.tempF.toStringAsFixed(0)}°F',
              style: textStyles.euclidBold.copyWith(
                fontSize: sizes.fontRatio * 62,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
