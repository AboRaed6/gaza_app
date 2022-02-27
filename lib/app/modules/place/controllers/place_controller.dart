import 'package:get/get.dart';
import 'package:logger/logger.dart';

class PlaceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Logger().e(Get.arguments['title']);
    Logger().e(Get.arguments['image']);
    Logger().e(Get.arguments['desc']);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
