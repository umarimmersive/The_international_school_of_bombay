import 'package:get/get.dart';

import '../controllers/mounthwise_syllabus_controller.dart';

class MounthwiseSyllabusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MounthwiseSyllabusController>(
      () => MounthwiseSyllabusController(),
    );
  }
}
