import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_app/app/config/langTheme/lang_theme.dart';
import 'package:gaza_app/app/config/translations/message_transaction.dart';
import 'package:gaza_app/app/config/translations/transltions_controller.dart';
import 'package:gaza_app/constant/colors.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //init local storage
  await GetStorage.init();
  Get.put(TranslationController());
  runApp(ScreenUtilInit(
    designSize: Size(360.0, 712.0),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: () => DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) {
          return GetMaterialApp(
            title: "Antique Gaza",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            locale: LangTheme().getFromboxLang(),
            fallbackLocale: Locale('ar','Ar'),
            translations: MessageTransaction(),
            theme: ThemeData(primaryColor: ColorClass.appBarColor,),
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              //add this line
              ScreenUtil.setContext(context);
              return MediaQuery(
                //Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: DevicePreview.appBuilder(context, widget),
                //child: widget ?? Container(),
              );
            },
          );
        }),
  ));
}
