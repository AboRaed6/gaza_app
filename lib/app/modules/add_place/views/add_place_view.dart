import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_app/app/modules/add_place/views/widgets/custom_dialog.dart';
import 'package:gaza_app/constant/colors.dart';
import 'package:gaza_app/constant/custom_text_field.dart';

import 'package:get/get.dart';
import 'package:google_language_fonts/google_language_fonts.dart';

import '../controllers/add_place_controller.dart';

class AddPlaceView extends GetView<AddPlaceController> {
  @override
  Widget build(BuildContext context) {
    Get.put(AddPlaceController());
    return Scaffold(
      body: GetBuilder<AddPlaceController>(
        builder: (_) => SingleChildScrollView(
          child: Form(
            key: controller.key,
            child: Column(
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
                      SizedBox(
                        width: 50.w,
                      ),
                      Center(
                        child: Container(
                          width: 150.w,
                          height: 48.h,
                          color: ColorClass.containerColor,
                          child: Center(
                            child: Text(
                              'اضافة مكان',
                              style: GoogleFonts.getFont('Cairo',
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  color: ColorClass.textColor,
                                  fontSize: 18.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () {
                    controller.imagePicker();
                    print(controller.imageName);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: controller.imagePath == null
                        ? CachedNetworkImage(
                            imageUrl:
                                'https://www.noage-official.com/wp-content/uploads/2020/06/placeholder.png',
                            fit: BoxFit.fitWidth,
                          )
                        : Image.file(
                            File(controller.imagePath!.path),
                            fit: BoxFit.fitWidth,
                          ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      customDialog(context);
                    },
                    child: TextFormField(
                      enabled: false,
                      readOnly: true,
                      textDirection: TextDirection.rtl,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الرجاء ملئ الحقل';
                        }
                      },
                      controller: controller.placeController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'اختار المحافظة',
                        hintTextDirection: TextDirection.rtl,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  controller: controller.titleController,
                  hintText: 'المكان',
                  inputType: TextInputType.text,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  controller: controller.descController,
                  hintText: 'تفاصيل عن المكان',
                  inputType: TextInputType.text,
                  minLines: 5,
                ),
                SizedBox(
                  height: 10.h,
                ),
                controller.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: ColorClass.appBarColor,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minWidth: double.infinity,
                          height: 50,
                          color: ColorClass.appBarColor,
                          onPressed: () {
                            if (controller.key.currentState!.validate()) {
                              controller.addToCity();
                            }
                          },
                          child: Text(
                            'اضافة المكان',
                            style: GoogleFonts.getFont('Cairo',
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                color: ColorClass.whiteColor,
                                fontSize: 18.sp),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
