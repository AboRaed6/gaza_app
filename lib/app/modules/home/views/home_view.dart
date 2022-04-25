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
                  top: size.height / 12,
                  // 150.h,
                  left: size.width / 1.4,
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
                  top: size.height / 9,
                  left: size.width / 1.2,
                  textCity: 'بيت حانون'.tr,
                  onTap: () {
                    print('بيت حانون');
                    controller.cityChange('بيت حانون');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: size.height / 7,
                  left: size.width / 1.3,
                  textCity: 'جباليا'.tr,
                  onTap: () {
                    print('جباليا');
                    controller.cityChange('جباليا');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: size.height / 8,
                  left: size.width / 1.6,
                  textCity: 'الشاطئ'.tr,
                  onTap: () {
                    print('الشاطئ');
                    controller.cityChange('الشاطئ');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: size.height / 6,
                  left: size.width / 1.5,
                  textCity: 'غزة'.tr,
                  onTap: () {
                    print('غزة');
                    controller.cityChange('غزة');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: size.height / 5,
                  left: size.width / 2.0,
                  textCity: 'الزهراء'.tr,
                  onTap: () {
                    print('الزهراء');
                    controller.cityChange('الزهراء');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: size.height / 4,
                  left: size.width / 2.5,
                  textCity: 'النصيرات'.tr,
                  onTap: () {
                    print('النصيرات');
                    controller.cityChange('النصيرات');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: size.height / 3.3,
                  left: size.width / 2.4,
                  textCity: 'البريج'.tr,
                  onTap: () {
                    print('البريج');
                    controller.cityChange('البريج');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: size.height / 2.9,
                  left: size.width / 2.8,
                  textCity: 'المغازي'.tr,
                  onTap: () {
                    print('المغازي');
                    controller.cityChange('المغازي');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: size.height / 2.9,
                  left: size.width / 5,
                  textCity: 'دير البلح'.tr,
                  onTap: () {
                    print('دير البلح');
                    controller.cityChange('دير البلح');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: size.height / 2.4,
                  left: size.width / 5.4,
                  textCity: 'خانيونس'.tr,
                  onTap: () {
                    print('خانيونس');
                    controller.cityChange('خانيونس');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: size.height / 2.1,
                  left: size.width / 3.5,
                  textCity: 'عبسان'.tr,
                  onTap: () {
                    print('عبسان');
                    controller.cityChange('عبسان');
                    Get.to(() => CityView(),
                        arguments: {'city': controller.city});
                  },
                ),
                CityWidget(
                  top: size.height / 2.1,
                  left: size.width / 9,
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
