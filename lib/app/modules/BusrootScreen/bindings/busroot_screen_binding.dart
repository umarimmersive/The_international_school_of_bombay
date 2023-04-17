import 'package:get/get.dart';

import '../controllers/busroot_screen_controller.dart';

class BusrootScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusrootScreenController>(
      () => BusrootScreenController(),
    );
  }
}
