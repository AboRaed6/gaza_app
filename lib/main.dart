import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
