import 'package:get/get.dart';

import '../controllers/busroot_details_controller.dart';

class BusrootDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusrootDetailsController>(
      () => BusrootDetailsController(),
    );
  }
}
