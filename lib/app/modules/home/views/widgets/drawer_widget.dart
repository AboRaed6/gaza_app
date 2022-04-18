import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_app/app/config/langTheme/lang_theme.dart';
import 'package:gaza_app/app/config/translations/transltions_controller.dart';
import 'package:gaza_app/app/modules/home/views/home_view.dart';
import 'package:gaza_app/app/modules/what_is_gaza/views/what_is_gaza_view.dart';
import 'package:gaza_app/constant/colors.dart';
import 'package:get/get.dart';

import 'custom_dialog.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

final locale = [
  {
    'name': 'English'.tr,
    'locale': Locale('en', 'US'),
  },
  {
    'name': 'Arabic'.tr,
    'locale': Locale('ar', 'Ar'),
  }
];

class _DrawerWidgetState extends State<DrawerWidget> {
  showLocaleDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Choose Language'.tr),
        content: Container(
          width: double.maxFinite,
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                updateLocale(
                    locale: locale[index]['locale'] as Locale,
                    context: context);
                LangTheme().saveInboxLang(locale[index]['locale'] as Locale);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('${locale[index]['name']}'.tr),
              ),
            ),
            separatorBuilder: (context, index) => const Divider(
              color: Colors.black,
            ),
            itemCount: 2,
          ),
        ),
      ),
    );
  }

  updateLocale({required Locale locale, required BuildContext context}) {
    Get.back();
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TranslationController());
    return Drawer(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: ColorClass.appBarColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.r),
                    bottomRight: Radius.circular(5.r)),
              ),
              child: Container(
                child: Image.asset('assets/images/logop.png'),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            listTiles(
              label: 'الرئيسية'.tr,
              icon: Icons.home,
              onTap: () {
                Get.off(() => HomeView());
              },
            ),
            listTiles(
              label: 'ما هي غزة ؟'.tr,
              icon: Icons.article,
              onTap: () {
                Get.to(() => WhatIsGazaView());
                // Get.off(() => ProfileView());
              },
            ),
            listTiles(
              label: 'حول التطبيق'.tr,
              icon: Icons.quiz_sharp,
              onTap: () {
                Get.back();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialogBox(
                        title: "حول التطبيق".tr,
                        descriptions:
                            "تم إنشاء هذا التطبيق (Antique Gaza) بسبب سياسة الكيان الصهيوني الغاشم في تحريف وتزوير أسماء المعالم والمناطق الأثرية والمحافظات الفلسطينية تحديدا في مدينة غزةفسعينا من خلال هذا التطبيق لإبراز الصورة الصحيحة للعالم بأسره عن الأسماء الحقيقية لتلك المعالم الأثرية.".tr,
                        text: "اغلاق".tr,
                      );
                    });
              },
            ),
            Divider(),
            listTiles(
              label: 'اللغة'.tr,
              icon: Icons.translate,
              onTap: () {
                showLocaleDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget listTiles({
    required String label,
    required Function onTap,
    required IconData icon,
  }) {
    return ListTile(
      onTap: () {
        onTap();
      },
      leading: Icon(
        icon,
        color: ColorClass.textColor,
      ),
      title: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: ColorClass.textColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
