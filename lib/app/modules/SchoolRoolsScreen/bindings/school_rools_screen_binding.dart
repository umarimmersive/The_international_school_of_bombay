import 'package:get/get.dart';

import '../controllers/school_rools_screen_controller.dart';

class SchoolRoolsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchoolRoolsScreenController>(
      () => SchoolRoolsScreenController(),
    );
  }
}
