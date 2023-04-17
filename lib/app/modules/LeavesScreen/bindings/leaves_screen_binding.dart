import 'package:get/get.dart';

import '../controllers/leaves_screen_controller.dart';

class LeavesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeavesScreenController>(
      () => LeavesScreenController(),
    );
  }
}
