import 'package:flutter/material.dart';
import 'package:gaza_app/app/modules/city/views/city_view.dart';
import 'package:gaza_app/app/modules/home/views/widgets/city_widget.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Get.put(HomeController());
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (_) => Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            width: 310.w,
            height: 490.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/map.png'),
              ),
            ),
            child: Stack(
              children: [
                CityWidget(
                  top: 130.h,
                  // 150.h,
                  left: 260.w,
                  // 270.w,
                  textCity: 'بيت لاهيا'.tr,
                  onTap: () {
                    print('بيت لاهيا');
                    print(MediaQuery.of(context).size.height);
                    print(MediaQuery.of(context).size.width);
                    controller.cityChange('بيت لاهيا');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: 160.h,
                  left: 300.w,
                  textCity: 'بيت حانون'.tr,
                  onTap: () {
                    print('بيت حانون');
                    controller.cityChange('بيت حانون');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: 200.h,
                  left: 280.w,
                  textCity: 'جباليا'.tr,
                  onTap: () {
                    print('جباليا');
                    controller.cityChange('جباليا');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: 180.h,
                  left: 220.w,
                  textCity: 'الشاطئ'.tr,
                  onTap: () {
                    print('الشاطئ');
                    controller.cityChange('الشاطئ');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: 230.h,
                  left: 220.w,
                  textCity: 'غزة'.tr,
                  onTap: () {
                    print('غزة');
                    controller.cityChange('غزة');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: 250.h,
                  left: 170.w,
                  textCity: 'الزهراء'.tr,
                  onTap: () {
                    print('الزهراء');
                    controller.cityChange('الزهراء');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: 280.h,
                  left: 140.w,
                  textCity: 'النصيرات'.tr,
                  onTap: () {
                    print('النصيرات');
                    controller.cityChange('النصيرات');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: 310.h,
                  left: 160.w,
                  textCity: 'البريج'.tr,
                  onTap: () {
                    print('البريج');
                    controller.cityChange('البريج');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: 350.h,
                  left: 130.w,
                  textCity: 'المغازي'.tr,
                  onTap: () {
                    print('المغازي');
                    controller.cityChange('المغازي');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: 350.h,
                  left: 80.w,
                  textCity: 'دير البلح'.tr,
                  onTap: () {
                    print('دير البلح');
                    controller.cityChange('دير البلح');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: 390.h,
                  left: 60.w,
                  textCity: 'خانيونس'.tr,
                  onTap: () {
                    print('خانيونس');
                    controller.cityChange('خانيونس');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: 440.h,
                  left: 100.w,
                  textCity: 'عبسان'.tr,
                  onTap: () {
                    print('عبسان');
                    controller.cityChange('عبسان');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: 480.h,
                  left: 40.w,
                  textCity: 'رفح'.tr,
                  onTap: () {
                    print('رفح');
                    controller.cityChange('رفح');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
