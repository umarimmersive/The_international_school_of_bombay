import 'package:get/get.dart';

import '../controllers/our_campus_controller.dart';

class OurCampusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OurCampusController>(
      () => OurCampusController(),
    );
  }
}
