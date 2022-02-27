import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gaza_app/app/data/models/city_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String city = '';



  void cityChange(String c) {
    city = c;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
