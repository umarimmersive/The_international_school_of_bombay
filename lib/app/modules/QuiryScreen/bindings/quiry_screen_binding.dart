import 'package:get/get.dart';

import '../controllers/quiry_screen_controller.dart';

class QuiryScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuiryScreenController>(
      () => QuiryScreenController(),
    );
  }
}
