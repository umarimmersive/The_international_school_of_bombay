import 'package:get/get.dart';

import '../controllers/hoppiness_controller.dart';

class HoppinessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HoppinessController>(
      () => HoppinessController(),
    );
  }
}
