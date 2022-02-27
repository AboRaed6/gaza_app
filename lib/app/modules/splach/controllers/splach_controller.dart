import 'dart:async';

import 'package:gaza_app/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

class SplachController extends GetxController {
  //TODO: Implement SplachController

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  startTimer() {
    Timer(const Duration(seconds: 5), () async {
      Get.off(() => HomeView());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
