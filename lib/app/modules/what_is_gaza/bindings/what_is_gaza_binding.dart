import 'package:get/get.dart';

import '../controllers/what_is_gaza_controller.dart';

class WhatIsGazaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WhatIsGazaController>(
      () => WhatIsGazaController(),
    );
  }
}
