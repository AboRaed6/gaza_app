import 'package:get/get.dart';

import '../controllers/splach_controller.dart';

class SplachBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplachController>(
      () => SplachController(),
    );
  }
}
