import 'package:flutter/cupertino.dart';
import 'package:gaza_app/app/config/langTheme/lang_theme.dart';
import 'package:get/get.dart';

class TranslationController extends GetxController {
  // bool listTileSwitch = LangTheme().getFromboxLang();

  // void switchList(bool val) {
  //   listTileSwitch = val;
  //   if(val == true){
  //
  //   }
  //   update();
  // }

  @override
  void onInit() {
    LangTheme().getFromboxLang();

    super.onInit();
  }
}
