import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_app/app/modules/add_place/controllers/add_place_controller.dart';
import 'package:gaza_app/constant/colors.dart';
import 'package:get/get.dart';


customDialog(context){
  var controller = Get.put(AddPlaceController());
  var size = MediaQuery.of(context).size;
  Get.defaultDialog(
    radius: 0,
    title: 'المحافظات',
    titleStyle: TextStyle(
      color: ColorClass.appBarColor,
      fontSize: 20.sp,
    ),
    content: Container(
      width: size.width * 0.9.w,
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: ColorClass.cities.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.selectCategory(index);
              Get.back();
            },
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.red[200],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${ColorClass.cities[index]}',
                      style: TextStyle(
                        color: Color(0xff00325A),
                        // fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text('Close'),
      ),
    ],
  );
}