import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_app/app/modules/add_place/views/add_place_view.dart';
import 'package:gaza_app/app/modules/city/views/widgets/area_widget.dart';
import 'package:gaza_app/app/modules/home/views/widgets/drawer_widget.dart';
import 'package:gaza_app/app/modules/place/views/place_view.dart';
import 'package:gaza_app/constant/colors.dart';

import 'package:get/get.dart';
import 'package:google_language_fonts/google_language_fonts.dart';

import '../controllers/city_controller.dart';

class CityView extends GetView<CityController> {
  @override
  Widget build(BuildContext context) {
    Get.put(CityController());
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        backgroundColor: ColorClass.appBarColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: ColorClass.whiteColor,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 80.h,
            decoration: BoxDecoration(
              color: ColorClass.appBarColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'محافظة'.tr,
                  style: GoogleFonts.getFont('Cairo',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: ColorClass.whiteColor,
                      fontSize: 18.sp),
                ),
                Container(
                  width: 100.w,
                  height: 48.h,
                  color: ColorClass.containerColor,
                  child: Center(
                    child: Text(
                      '${Get.arguments['city']}'.tr,
                      style: GoogleFonts.getFont('Cairo',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: ColorClass.textColor,
                          fontSize: 18.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              width: 305.w,
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: ColorClass.containerColor,
              ),
              child: Center(
                  child: Text(
                'المناطق الأثرية الموجودة بها'.tr,
                style: GoogleFonts.getFont(
                  'Cairo',
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: ColorClass.textColor,
                  fontSize: 18.sp,
                ),
              )),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection(Get.arguments['city'])
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorClass.appBarColor,
                        ),
                      );
                    }
                    if (controller.title.isEmpty &&
                        snapshot.connectionState == ConnectionState.done) {
                      return Center(
                        child: Text(
                          'المحافظة لا يوجد بها مواقع أثرية'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorClass.appBarColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) => AreaWidget(
                          onTap: () {
                            Get.to(() => PlaceView(), arguments: {
                              'city': Get.arguments['city'],
                              'title': controller.title[index],
                              'desc': controller.desc[index],
                              'image': controller.image[index],
                              'lat': controller.lat[index],
                              'long': controller.long[index],
                            });
                          },
                          textTitle: controller.title[index],
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20.h,
                        ),
                        itemCount: controller.title.length,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddPlaceView());
        },
        child: Icon(
          Icons.add,
          color: ColorClass.whiteColor,
        ),
        backgroundColor: ColorClass.appBarColor,
      ),
    );
  }
}
