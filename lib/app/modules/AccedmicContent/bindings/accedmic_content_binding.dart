import 'package:get/get.dart';

import '../controllers/accedmic_content_controller.dart';

class AccedmicContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccedmicContentController>(
      () => AccedmicContentController(),
    );
  }
}
