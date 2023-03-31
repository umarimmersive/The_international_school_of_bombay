import 'package:get/get.dart';

import '../controllers/campus_controller.dart';

class CampusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CampusController>(
      () => CampusController(),
    );
  }
}
