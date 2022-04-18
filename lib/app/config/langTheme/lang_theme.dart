import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class LangTheme{
  String keylang = 'isLang';
  // static final String CURRENT_LOCAL = 'current_local';
  GetStorage boxStorage = GetStorage();
  void saveInboxLang(Locale isLang) {
    boxStorage.write(keylang, isLang);
  }

  Locale getFromboxLang() {
    return boxStorage.read(keylang) ?? Locale('ar', 'Ar');
  }

  Locale get themeLang => getFromboxLang() == Locale('en', 'US')
      ? Locale('en', 'US')
      : Locale('ar', 'Ar');

  void changeThemeLang() {
    Get.updateLocale(getFromboxLang() == Locale('ar', 'Ar')
        ? Locale('ar', 'Ar')
        : Locale('en', 'US'));
    saveInboxLang(getFromboxLang());
  }
}