import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_app/constant/colors.dart';
import 'package:get/get.dart';

class CustomDialogBox extends StatefulWidget {
  final String? title, descriptions, text;
  final Image? img;

  const CustomDialogBox(
      {Key? key, this.title, this.descriptions, this.text, this.img})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: 10, top: 10 + 10, right: 10, bottom: 10),
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 15.h,
              ),
              Text(
                widget.descriptions!.tr,
                style: TextStyle(fontSize: 14.sp),
                // textAlign: TextAlign.center,
                // textDirection: TextDirection.rtl,
              ),
              SizedBox(
                height: 22.h,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      widget.text!.tr,
                      style: TextStyle(
                          fontSize: 18.sp, color: ColorClass.appBarColor),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20.r,
            child: Container(
              height: 50.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: ColorClass.appBarColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                  child: Text(
                'حول التطبيق'.tr,
                style: TextStyle(color: ColorClass.whiteColor),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
