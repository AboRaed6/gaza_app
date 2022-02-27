import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_app/app/modules/add_place/views/add_place_view.dart';
import 'package:gaza_app/app/modules/city/views/widgets/area_widget.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: 194.h,
            decoration: BoxDecoration(
              color: ColorClass.appBarColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ColorClass.whiteColor,
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 48.h,
                  color: ColorClass.containerColor,
                  child: Center(
                    child: Text(
                      Get.arguments['city'],
                      style: GoogleFonts.getFont('Cairo',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: ColorClass.textColor,
                          fontSize: 18.sp),
                    ),
                  ),
                ),
                Text(
                  'محافظة',
                  style: GoogleFonts.getFont('Cairo',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: ColorClass.whiteColor,
                      fontSize: 18.sp),
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
                'المناطق الأثرية الموجودة بها',
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
              if (controller.title.isEmpty) {
                return Center(
                  child: Text(
                    'المحافظة لا يوجد بها مواقع أثرية',
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
          // GetBuilder<CityController>(builder: (_) {
          //   if (controller.isLoadingZahra == true &&
          //       controller.titleZahra.isEmpty) {
          //     return Center(
          //       child: Text(
          //         'المدينة لا يوجد بها مواقع اثرية',
          //         style: TextStyle(
          //           fontSize: 20.sp,
          //           color: ColorClass.appBarColor,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     );
          //   } else if (controller.isLoadingZahra == true) {
          //     return Center(
          //       child: CircularProgressIndicator(
          //         color: ColorClass.appBarColor,
          //       ),
          //     );
          //   } else {
          //     return ListView.separated(
          //       shrinkWrap: true,
          //       primary: false,
          //       itemBuilder: (context, index) => AreaWidget(
          //         onTap: () {
          //           Get.to(() => PlaceView(),
          //               arguments: {'city': Get.arguments['city']});
          //         },
          //         textTitle: controller.titleZahra[index],
          //       ),
          //       separatorBuilder: (context, index) => SizedBox(
          //         height: 20.h,
          //       ),
          //       itemCount: controller.titleZahra.length,
          //     );
          //   }
          // }),
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
