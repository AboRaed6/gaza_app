import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_app/app/modules/map/views/map_view.dart';
import 'package:gaza_app/constant/colors.dart';

import 'package:get/get.dart';
import 'package:google_language_fonts/google_language_fonts.dart';

import '../controllers/place_controller.dart';

class PlaceView extends GetView<PlaceController> {
  @override
  Widget build(BuildContext context) {
    Get.put(PlaceController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorClass.appBarColor,
        elevation: 0,
        leading: Container(),
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
                  'محافظة',
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
                      Get.arguments['city'],
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
            height: 10.h,
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
                Get.arguments['title'],
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: Get.arguments['image'],
                    width: double.infinity,
                    height: 300.h,
                    placeholder: (context, url) => Image.network(
                        'https://www.noage-official.com/wp-content/uploads/2020/06/placeholder.png'),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: MaterialButton(
                        color: ColorClass.dotColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.place,
                              color: ColorClass.whiteColor,
                            ),
                            Text(
                              'انتقل الى الخريطة',
                              style: TextStyle(
                                color: ColorClass.whiteColor,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Get.to(() => MapView(), arguments: {
                            'lat': Get.arguments['lat'],
                            'long': Get.arguments['long'],
                            'title': Get.arguments['title'],
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      Get.arguments['desc'],
                      style: GoogleFonts.getFont(
                        'Cairo',
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: ColorClass.blackColor,
                        fontSize: 18.sp,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ),
          //body
        ],
      ),
    );
  }
}
