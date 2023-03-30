import 'package:get/get.dart';

import '../controllers/contect_us_controller.dart';

class ContectUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContectUsController>(
      () => ContectUsController(),
    );
  }
}
